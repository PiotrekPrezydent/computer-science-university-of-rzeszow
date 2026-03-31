import pandas as pd
from collections import defaultdict
from sklearn.datasets import load_iris
import os
import sys
import bisect

class CutPoint:
    def __init__(self, attribute: str, threshold: float):
        self.attribute = attribute                  # Nazwa atrybutu
        self.threshold = threshold                  # Wartość cięcia (threshold)
        self.separated_pairs = 0                    # Liczba par obiektów separowanych przez cięcie (kryterium 1)
        self.label_switch = 0  # NOWY parametr – zmiana klasy między punktami wokół cięcia
        self.priority_score = 0 
    
    def __repr__(self):
        return (f"CutPoint(attr='{self.attribute}', threshold={self.threshold:.3f}, "
                f"separated_pairs={self.separated_pairs}, "
                f"label_switch={self.label_switch}")
    
def non_detertymistic_objects_conunt(X: pd.DataFrame, y: pd.Series):
    n = len(X)
    c = 0
    for i in range(n):
        xi = X.iloc[i]
        yi = y.iloc[i]
        for j in range(i+1,n):
            yj = y.iloc[j]
            xj = X.iloc[j]
            if yi == yj:
                continue
            same_values = True
            for attr in X.columns:
                xi_atr_v = xi[attr]
                xj_atr_v = xj[attr]
                #print(f"{attr}, {xi_atr_v}, {xj_atr_v}\n{xi}\n")

                if xi_atr_v != xj_atr_v:
                    same_values = False
            if same_values:
                print(f"{xi} z dec {yi}\n na {xj} z dec {yj}\n\n")
                c+=1
    return c



def generate(X: pd.DataFrame, y: pd.Series):
    cuts = []
    n = len(X)
    seen = set()
    for col in X.columns:
        sorted_df = X.copy()
        sorted_df['dec'] = y
        sorted_df = sorted_df.sort_values(by=col).reset_index(drop=True)
        for i in range(n - 1):
            xi = sorted_df.iloc[i]
            xj = sorted_df.iloc[i+1]
            #cant seperate on this attribute
            if xi[col] == xj[col]:
                continue

            threshold = (xi[col] + xj[col]) / 2

            key = (col, threshold)
            if key in seen:
                continue
            seen.add(key)

            cut = CutPoint(attribute=col, threshold=threshold)

            left = sorted_df[sorted_df[col] < threshold]
            right = sorted_df[sorted_df[col] >= threshold]

            # Liczymy ile jest obiektów z każdej klasy decyzyjnej po lewej i prawej stronie
            left_counts = left['dec'].value_counts()
            right_counts = right['dec'].value_counts()

            # Liczymy pary o różnych decyzjach: left_dec != right_dec
            separated = 0
            for l_dec, l_count in left_counts.items():
                for r_dec, r_count in right_counts.items():
                    if l_dec != r_dec:
                        separated += l_count * r_count

            cut.separated_pairs = separated

            if xi['dec'] == xj['dec']:
                cut.label_switch = 0
            else:
                cut.label_switch = 1
            
            cut.priority_score = (1 if cut.label_switch == 0 else 0) * 1_000_000 + separated
            cuts.append(cut)
            print(f"Created cut: {cut}")
    return cuts

def select_best_cut(cuts: list, X: pd.DataFrame, y: pd.Series, unremovable: list,non_dete_c) -> CutPoint:
    best_cut = None

    for cut in cuts:
        if cut in unremovable:
            continue
        # Symulacja: usunięcie tego cięcia
        remaining_cuts = cuts.copy()
        remaining_cuts.remove(cut)

        # Sprawdzamy, czy usunięcie cięcia nie psuje separacji klas
        if are_all_diffrent_decisions_separated(X, y, remaining_cuts,cut,non_dete_c):
            # Jeśli znaleźliśmy cięcie, które spełnia warunki, to aktualizujemy wynik
            best_cut = cut
            break  # Zatrzymujemy się po znalezieniu pierwszego najlepszego cięcie
        else:
            unremovable.append(cut)

    return best_cut, unremovable

def save_bins_to_csv(object_bins, filename='output.csv'):
    print(f"saving to: {filename}")
    with open(filename, mode='w+', newline='') as file:
        for bin_key, decision in object_bins:
            row = []
            for _, (low, high) in bin_key:
                bin_repr = f"({low};{high}"
                bin_repr += ")" if str(high) == "inf" else "]"
                row.append(bin_repr)
            row.append(str(decision))
            file.write(','.join(row) + '\n')

def are_all_diffrent_decisions_separated(X: pd.DataFrame, y: pd.Series, cutpoints: list[CutPoint], cuted, allowed_non_determistic) -> bool:
    n = len(X)
    c = 0
    # Indeksujemy cięcia według atrybutów i sortujemy progi
    cuts_by_attr = defaultdict(list)
    for cut in cutpoints:
        cuts_by_attr[cut.attribute].append(cut.threshold)

    for attr in cuts_by_attr:
        cuts_by_attr[attr].sort()

    for i in range(n):
        xi = X.iloc[i]
        yi = y.iloc[i]

        for j in range(i + 1, n):
            yj = y.iloc[j]
            if yi == yj:
                continue

            xj = X.iloc[j]
            separated = False

            for attr in X.columns:
                vi, vj = xi[attr], xj[attr]
                lower, upper = min(vi, vj), max(vi, vj)

                thresholds = cuts_by_attr[attr]

                # Użyj bisect, by znaleźć miejsce cięcia w przedziale (lower, upper)
                left = bisect.bisect_right(thresholds, lower)
                right = bisect.bisect_left(thresholds, upper)

                if left < right:
                    separated = True
                    break  # już oddzielone tym atrybutem

            if not separated:
                c +=1
                #print(f"obiekt \n{xi}, {yi} \nnie jest w żaden sposób separowany od \n{xj}, {yj} \nwięc nie można usunąć cięcia \n{cuted}\n")
    if c > allowed_non_determistic:
        return False
    return True



def create_bins_summary(cuts: list, X: pd.DataFrame, y: pd.Series):
    # Krok 1: zrób listę progów dla każdego atrybutu
    cut_dict = defaultdict(list)
    for cut in cuts:
        cut_dict[cut.attribute].append(cut.threshold)

    # Krok 2: dodaj granice (-inf, +inf), posortuj
    attr_bins = {}
    for attr in X.columns:
        thresholds = sorted(cut_dict[attr])
        attr_bins[attr] = [float('-inf')] + thresholds + [float('inf')]

    # Krok 3: dla każdego obiektu znajdź jego bin i zapisz osobno
    object_bins = []

    for idx, row in X.iterrows():
        bin_ranges = []
        for attr in X.columns:
            val = row[attr]
            bins_for_attr = attr_bins[attr]
            for i in range(len(bins_for_attr) - 1):
                if bins_for_attr[i] < val <= bins_for_attr[i + 1]:
                    bin_ranges.append((attr, (bins_for_attr[i], bins_for_attr[i + 1])))
                    break
        object_bins.append((tuple(bin_ranges), y.loc[idx]))  # zapisujemy bin i decyzję dla konkretnego obiektu
    return object_bins

def load_data(file_path=None):
    file_name = ""
    if file_path != None:
        file_name_without_extension = os.path.splitext(os.path.basename(file_path))[0]
    if len(sys.argv) > 1:
        file_path = sys.argv[1]

    if file_path:
        # Wczytanie danych z pliku CSV
        data = pd.read_csv(file_path)
        X = data.iloc[:, :-1]  # Wszystkie kolumny oprócz ostatniej (atrybuty)
        y = data.iloc[:, -1]   # Ostatnia kolumna (klasa)
    else:
        # Wczytanie zbioru Iris
        iris = load_iris()
        X = pd.DataFrame(iris.data, columns=iris.feature_names)
        y = pd.Series(iris.target)
    if file_path == None:
        file_name = "iris"
    else:
        file_name = file_name_without_extension
    return X, y, file_name

def main(file_path = None):
    X,y,file_name = load_data(file_path)
    non_det = non_detertymistic_objects_conunt(X,y)
    # Generowanie przedziałów
    starter_cut_points = generate(X, y)
    print(len(starter_cut_points))
    #print(f"{len(cuts)} vs {len(starter_cut_points)} na {len(X)}")
    print("ended generating statring cut_points")

    sorted_cut_points = sorted(
        starter_cut_points,
        key=lambda cut: cut.priority_score,
        reverse=True  # Sortowanie malejąco, od najwyższego priorytetu
    )

    print("enden sorting cut points, removing cuts starts now")

    new_cut_points = sorted_cut_points.copy()
    unremovable = []
    while True:
        cut, unremovable = select_best_cut(new_cut_points,X,y, unremovable,non_det)
        if cut == None:
            break
        print(f"removed: {cut}")
        new_cut_points.remove(cut)
    bins_summary = create_bins_summary(new_cut_points, X, y)
    save_bins_to_csv(bins_summary,filename=f"DISC{file_name}.csv")


if __name__ == "__main__":
    main("data3.csv")
