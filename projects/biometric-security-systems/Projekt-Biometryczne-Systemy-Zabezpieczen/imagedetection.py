import cv2
import mediapipe as mp
import json
import os
import numpy as np

from livedetection import detect_finger_gesture, extract_hand_features

mp_hands = mp.solutions.hands
hands = mp_hands.Hands(
    static_image_mode=True,
    max_num_hands=1,
    min_detection_confidence=0.7
)
mp_draw = mp.solutions.drawing_utils

def draw_hand_annotations(img, landmarks, handedness_label, w, h):
    # Wykryj gest
    gesture_info = detect_finger_gesture(landmarks, handedness_label)
    fingers_up = gesture_info["fingers_up"]

    # Wylicz cechy
    features_info = extract_hand_features(landmarks, w, h)

    # Końcówki palców
    fingertip_ids = [4, 8, 12, 16, 20]
    for i, idx in enumerate(fingertip_ids):
        cx, cy = int(landmarks[idx].x * w), int(landmarks[idx].y * h)
        color = (0, 255, 0) if fingers_up[i] else (0, 0, 255)
        cv2.circle(img, (cx, cy), 8, color, -1)

    # Niebieska kropka - środek dłoni przesunięty w dół
    middle_tip_y = int(landmarks[12].y * h)
    palm_x = int(features_info["palm_center"][0] * w)
    palm_y = int(features_info["palm_center"][1] * h)
    blue_dot_y = max(palm_y, middle_tip_y) + 5
    cv2.circle(img, (palm_x, blue_dot_y), 8, (255, 0, 0), -1)

    return gesture_info, features_info

def analyze_image(image_path):
    img = cv2.imread(image_path)
    if img is None:
        print(f"Cannot load image: {image_path}")
        return

    h, w, _ = img.shape
    img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    result = hands.process(img_rgb)

    if not result.multi_hand_landmarks or not result.multi_handedness:
        print("No hand detected.")
        return

    # Tylko jedna dłoń
    hand_landmarks = result.multi_hand_landmarks[0]
    handedness_label = result.multi_handedness[0].classification[0].label
    landmarks = hand_landmarks.landmark

    # Folder zapisu
    base_name = os.path.splitext(os.path.basename(image_path))[0]
    output_dir = os.path.join(os.path.dirname(image_path), f"{base_name}-Analysis")
    os.makedirs(output_dir, exist_ok=True)

    # Rysowanie standardowe i nasze oznaczenia
    mp_draw.draw_landmarks(img, hand_landmarks, mp_hands.HAND_CONNECTIONS)
    gesture_info, features_info = draw_hand_annotations(img, landmarks, handedness_label, w, h)

    # Dane do JSON
    analysis = {
        "gesture": gesture_info,
        "features": features_info,
        "handedness": handedness_label,
        "image": os.path.basename(image_path)
    }

    # Zapis obrazka
    image_out_path = os.path.join(output_dir, "image-points.png")
    cv2.imwrite(image_out_path, img)

    # Zapis JSON
    json_out_path = os.path.join(output_dir, "image-analysis.json")
    with open(json_out_path, "w") as f:
        json.dump(analysis, f, indent=4)

    print(f"Saved: {image_out_path}")
    print(f"Saved: {json_out_path}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python analyze_image.py path/to/image.jpg")
    else:
        analyze_image(sys.argv[1])
