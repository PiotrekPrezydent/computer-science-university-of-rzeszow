import cv2
import mediapipe as mp
import numpy as np

# Inicjalizacja modułu MediaPipe Hands
mp_hands = mp.solutions.hands
hands = mp_hands.Hands(
    static_image_mode=False,
    max_num_hands=1,
    min_detection_confidence=0.7,
    min_tracking_confidence=0.5
)
mp_draw = mp.solutions.drawing_utils  # Narzędzia do rysowania punktów i połączeń

def detect_finger_gesture(landmarks, handedness_label):
    # Oblicz orientację dłoni
    orientation = "Front" if landmarks[17].x > landmarks[5].x else "Back"

    fingers_up = []

    # Indeksy dla zwykłych palców
    finger_tips = [8, 12, 16, 20]
    finger_dips = [6, 10, 14, 18]

    for tip, dip in zip(finger_tips, finger_dips):
        fingers_up.append(bool(landmarks[tip].y < landmarks[dip].y))


    # --- LEPSZA DETEKCJA KCIUKA ---

    # Wektor od punktu 2 do 3 i od 3 do 4 (czyli kierunek kciuka)
    def vector_angle(a, b, c):
        # Kąt pomiędzy wektorami a->b i c->b
        v1 = np.array([a.x - b.x, a.y - b.y])
        v2 = np.array([c.x - b.x, c.y - b.y])
        dot = np.dot(v1, v2)
        norm = np.linalg.norm(v1) * np.linalg.norm(v2) + 1e-6
        angle = np.arccos(np.clip(dot / norm, -1.0, 1.0))
        return angle

    thumb_angle = vector_angle(landmarks[2], landmarks[3], landmarks[4])  # kąt w stawie IP kciuka

    # Odległość od nadgarstka do końca kciuka (znormalizowana względem długości palca wskazującego)
    wrist = np.array([landmarks[0].x, landmarks[0].y])
    thumb_tip = np.array([landmarks[4].x, landmarks[4].y])
    index_tip = np.array([landmarks[8].x, landmarks[8].y])
    thumb_to_wrist_dist = np.linalg.norm(thumb_tip - wrist)
    reference_length = np.linalg.norm(index_tip - wrist) + 1e-6
    thumb_extended = thumb_angle > 1.2 and thumb_to_wrist_dist > 0.35 * reference_length

    fingers_up.insert(0, bool(thumb_extended))

    # Przygotuj opis gestów
    finger_names = ["Thumb", "Index", "Middle", "Ring", "Pinky"]
    fingers_status = [f"{name}: {'Up' if up else 'Down'}" for name, up in zip(finger_names, fingers_up)]

    return {
        "orientation": orientation,
        "fingers_up": fingers_up,
        "gesture": fingers_status
    }



def extract_hand_features(landmarks, image_width, image_height):
    """
    Wylicza cechy geometryczne dłoni: długości segmentów palców, kąty,
    środek dłoni i głębokość (z).
    Zwraca słownik z najważniejszymi wartościami.
    """
    points = np.array([[lm.x, lm.y, lm.z] for lm in landmarks])

    # Segmenty do obliczenia długości
    segments = [
        (0, 5), (5, 6), (6, 7), (7, 8),        # palec wskazujący
        (0, 9), (9, 10), (10, 11), (11, 12),  # palec środkowy
        (0, 13), (13, 14), (14, 15), (15, 16),# palec serdeczny
        (0, 17), (17, 18), (18, 19), (19, 20),# mały palec
        (0, 1), (1, 2), (2, 3), (3, 4)         # kciuk
    ]
    segment_lengths = [np.linalg.norm(points[b] - points[a]) for a, b in segments]

    # Normalizacja względem długości palca środkowego (od nadgarstka do koniuszka)
    reference_length = np.linalg.norm(points[0] - points[12]) + 1e-6
    normalized_lengths = [l / reference_length for l in segment_lengths]

    def angle_between(p1, p2, p3):
        # Kąt między wektorami p1-p2 i p3-p2 w radianach
        v1 = p1 - p2
        v2 = p3 - p2
        cosine = np.dot(v1, v2) / (np.linalg.norm(v1) * np.linalg.norm(v2) + 1e-6)
        return np.arccos(np.clip(cosine, -1.0, 1.0))

    finger_angle_sets = [
        (5, 6, 7), (6, 7, 8),
        (9, 10, 11), (10, 11, 12),
        (13, 14, 15), (14, 15, 16),
        (17, 18, 19), (18, 19, 20),
        (1, 2, 3), (2, 3, 4)
    ]
    angles = [angle_between(points[a], points[b], points[c]) for a, b, c in finger_angle_sets]

    # Obliczanie środka dłoni jako średnia z punktów: nadgarstek i podstawy palców
    palm_points_indices = [0, 5, 9, 13, 17]
    palm_center_x = np.mean([points[i][0] for i in palm_points_indices])
    palm_center_y = np.mean([points[i][1] for i in palm_points_indices])
    palm_center_normalized = (palm_center_x, palm_center_y)

    # Głębokość (oś Z) względem średniej wszystkich punktów
    z_depth = points[0][2] - np.mean(points[:, 2])

    return {
        "normalized_lengths": normalized_lengths,
        "angles": angles,
        "palm_center": palm_center_normalized,
        "z_depth": z_depth
    }

# Główna pętla przechwytująca obraz z kamery

if __name__ == "__main__":
    cap = cv2.VideoCapture(0)
    while cap.isOpened():
        success, img = cap.read()
        if not success:
            continue

        h, w, _ = img.shape
        img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        result = hands.process(img_rgb)

        if result.multi_hand_landmarks and result.multi_handedness:
            for hand_landmarks, hand_handedness in zip(result.multi_hand_landmarks, result.multi_handedness):
                # Rysowanie punktów i połączeń dłoni
                mp_draw.draw_landmarks(img, hand_landmarks, mp_hands.HAND_CONNECTIONS)

                landmarks = hand_landmarks.landmark
                handedness_label = hand_handedness.classification[0].label

                # Detekcja gestu i pozycji palców
                analysis = detect_finger_gesture(landmarks, handedness_label)

                fingertip_ids = [4, 8, 12, 16, 20]  # kciuk, wskazujący, środkowy, serdeczny, mały
                for i in fingertip_ids:
                    cx, cy = int(landmarks[i].x * w), int(landmarks[i].y * h)
                    color = (0, 255, 0) if analysis["fingers_up"][fingertip_ids.index(i)] else (0, 0, 255)
                    cv2.circle(img, (cx, cy), 6, color, -1)  # zielony jeśli palec wyprostowany, czerwony jeśli zgięty

                # Wyliczenie cech dłoni
                features = extract_hand_features(landmarks, w, h)

                # Obliczenie pozycji niebieskiej kropki: środek dłoni przesunięty lekko w dół względem koniuszka palca środkowego
                middle_tip_x = landmarks[12].x
                middle_tip_y = landmarks[12].y
                palm_x = int(features["palm_center"][0] * w)
                palm_y = int(features["palm_center"][1] * h)

                # Przesunięcie w osi Y o około 5 pikseli poniżej środka ciężkości dłoni lub koniuszka palca środkowego (co jest niżej)
                blue_dot_y = max(palm_y, int(middle_tip_y * h)) + 5
                blue_dot_x = palm_x

                cv2.circle(img, (blue_dot_x, blue_dot_y), 6, (255, 0, 0), -1)  # niebieska kropka

                # Przygotowanie tekstu do wyświetlenia (po angielsku)
                lengths_to_show = features["normalized_lengths"][:5]
                angles_to_show = features["angles"]
                palm_center_text = (features["palm_center"][0], features["palm_center"][1])

                text_lines = [
                    'Finger lengths: ' + ', '.join([f'{l:.2f}' for l in lengths_to_show]),
                    'Angles (rad): ' + ', '.join([f'{a:.2f}' for a in angles_to_show]),
                    f'Palm center (x,y): ({palm_center_text[0]:.2f}, {palm_center_text[1]:.2f})',
                    f'Orientation: {analysis["orientation"]}',
                    f'Gesture: {analysis["gesture"]}'
                ]


                # Pozycja i styl tekstu
                base_y = h - 20 * len(text_lines)
                font = cv2.FONT_HERSHEY_COMPLEX
                font_scale = 0.4
                thickness = 1

                # Rysowanie tekstu z wyraźnym cieniem (jasnoszary, grubsza linia)
                shadow_color = (25, 25, 25)  # mocniejszy cień
                for idx, line in enumerate(text_lines):
                    y = base_y + idx * 20
                    # Cień (kilka razy przesunięty dla pogrubienia)
                    for dx, dy in [(1,1), (2,1), (1,2)]:
                        cv2.putText(img, line, (10+dx, y+dy), font, font_scale, shadow_color, thickness+2, cv2.LINE_AA)
                    # Tekst główny (biały)
                    cv2.putText(img, line, (10, y), font, font_scale, (255, 255, 255), thickness, cv2.LINE_AA)

        cv2.imshow("Hand Gesture Detection", img)

        if cv2.waitKey(1) & 0xFF == 27:  # ESC do wyjścia
            break
    cap.release()
    cv2.destroyAllWindows()
