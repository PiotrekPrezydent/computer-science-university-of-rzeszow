import os
import time

import pandas as pd

class Tests:
    @staticmethod
    def test_algorithm(original_path, disc_path, time):
        # 1. Wczytaj dane
        df_original = pd.read_csv(original_path)
        df_disc = pd.read_csv(disc_path, header=None)
        n_rows, n_cols = df_disc.shape
        attr_cols = n_cols - 1
        # 2. Sprawdź zgodność rozmiaru
        if df_disc.shape != (n_rows, n_cols):
            raise ValueError("Rozmiar danych po dyskretyzacji nie zgadza się z oryginałem.")

        # 3. Sprawdź poprawność przedziałów
        for i in range(n_rows):
            for j in range(attr_cols):
                val = df_original.iat[i, j]
                interval = df_disc.iat[i, j]

                if interval == "(-inf; inf)":
                    continue

                try:
                    left, right = interval.replace("(", "").replace("]", "").split(";")
                    left = float(left.strip()) if left.strip() != "-inf" else float("-inf")
                    right = float(right.strip(")")) if right.strip() != "inf" else float("inf")
                except Exception as e:
                    print(f"Error parsing interval {interval}: {e}")
                    raise ValueError(f"Niepoprawny format przedziału: {interval}")

                try:
                    val = float(df_original.iat[i, j])
                except ValueError:
                    raise ValueError(
                        f"Niepoprawna wartość {df_original.iat[i, j]} w wierszu {i}, kolumnie {j} (oczekiwano liczbę)")

                interval = df_disc.iat[i, j]

                if not (left < val <= right):
                    print(val)
                    raise ValueError(f"Wartość {val} nie należy do przedziału {interval} (wiersz {i}, kolumna {j})")

                if df_disc.shape != df_original.shape:
                    raise ValueError("Rozmiar danych po dyskretyzacji nie zgadza się z oryginałem.")

        # 4. Liczba cięć
        cuts_total = 0
        for j in range(attr_cols):
            unique_intervals = set(df_disc.iloc[:, j])
            if "(-inf; inf)" in unique_intervals:
                unique_intervals.remove("(-inf; inf)")
            cuts_total += max(0, len(unique_intervals) - 1)

        # 5. Zlicz pary niedeterministyczne
        cond_cols = list(range(attr_cols))
        decision_col = n_cols - 1
        rows = df_disc.values.tolist()
        nondeterministic_pairs = 0

        for i in range(n_rows):
            for j in range(i + 1, n_rows):
                if all(rows[i][k] == rows[j][k] for k in cond_cols) and rows[i][decision_col] != rows[j][decision_col]:
                    nondeterministic_pairs += 1

        # 6. Zwróć wyniki testu
        return {
            "plik": os.path.basename(original_path),
            "cięcia": cuts_total,
            "niedeterministyczne pary": nondeterministic_pairs,
            "ocena": Tests.evaluate_discretization(cuts_total, nondeterministic_pairs, time),
        }

    @staticmethod
    def evaluate_discretization(cuts, nondeterministic_pairs, time):
        return 0.5 * nondeterministic_pairs + 0.25 * cuts + time



# ------------------------------------------
# PRZYKŁADOWE WYWOŁANIE CAŁEJ SESJI TESTOWEJ
# ------------------------------------------

import glob
from main import main


def run_test_session(data_paths, desc_data_paths):
    if not desc_data_paths or not len(desc_data_paths) == len(data_paths):
        desc_data_paths = list(map(lambda p: f"DISC{p}", data_paths.copy()))

    for f in glob.glob("DISC*.csv"): # Usuwa stare pliki DISC
        os.remove(f)
    for path in data_paths:
        start = time.time()
        main(path)
        end = time.time()

        print(f"\nCzas dyskretyzacji dla {path}: {end - start :.4f} sekund")

    for i in range(len(data_paths)):
        results = Tests.test_algorithm(data_paths[i], desc_data_paths[i],(end - start))
        print(f"\nPlik: {results['plik']}")
        print(f"  Liczba cięć: {results['cięcia']}")
        print(f"  Pary niedeterministyczne: {results['niedeterministyczne pary']}")
        print(f"  Ocena: {results['ocena']}")

data_paths = ["data2.csv"]
desc_data_paths = ["DISCdata1.csv","DISCdata2.csv","DISCdata3.csv"]

run_test_session(data_paths, desc_data_paths)

