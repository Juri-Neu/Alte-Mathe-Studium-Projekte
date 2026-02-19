import random

n = int(input("Zahl eingeben: "))
if n <= 1:
    print("FALSCH")
else:
    if n == 2 or n == 3:
        print("Ja")

    elif n % 2 == 0:
        print("Nein")
    else:
        d = n - 1
        r = 0
        while d % 2 == 0:
            d = d // 2
            r = r + 1
        k = 5
        i = 0
        wahrscheinlich_prim = True
        while i < k:
            a = random.randint(2, n - 2)
            x = pow(a, d, n)
            if x == 1 or x == n - 1:
                i = i + 1
                continue
            j = 0
            gefunden = False
            while j < r - 1:
                x = pow(x, 2, n)
                if x == n - 1:
                    gefunden = True
                    break
                j = j + 1
            if gefunden == False:
                wahrscheinlich_prim = False
                break
            i = i + 1
        if wahrscheinlich_prim:
            print("Ja")
        else:
            print("Nein")


################################ So würde ich heute den Miller-Rabin-Test schreiben:
################################ Beide würde ich eigentlich alle Funktionen in ein eigenes Modul packen
###############################ä Aber für Präsentations-Zwecke lass ich das mal
################################ Was ich zusetztlich eingebaut habe ist die Anzahl der Tests (oben sind die k=5)
################################

import random
from typing import Tuple, List

def decompose(n: int) -> Tuple[int, int]:
    d = n - 1
    r = 0
    while d % 2 == 0:
        d //= 2
        r += 1
    return r, d

def miller_rabin_test(n: int, base: int, r: int, d: int) -> bool:
    x = pow(base, d, n)
    if x == 1 or x == n - 1:
        return True
    for _ in range(r - 1):
        x = pow(x, 2, n)
        if x == n - 1:
            return True
    return False

def is_probable_prime(n: int, rounds: int = 10) -> Tuple[bool, List[int], int]:
    if n < 2:
        return False, [], -1
    if n in (2, 3):
        return True, [], -1
    if n % 2 == 0:
        return False, [], 2
    r, d = decompose(n)
    tested_bases = []
    for _ in range(rounds):
        base = random.randint(2, n - 2)
        tested_bases.append(base)
        if not miller_rabin_test(n, base, r, d):
            return False, tested_bases, base
    return True, tested_bases, -1


def main():
    print("Miller-Rabin Primzahltest")
    n = int(input("Zahl eingeben: "))
    rounds = int(input("Anzahl der Testdurchläufe (z.B. 10): "))
    result, bases, failing_base = is_probable_prime(n, rounds)
    print("\nGetestete Basen:", bases)
    if result:
        print("Ergebnis: Die Zahl ist wahrscheinlich prim.")
    else:
        print("Ergebnis: Die Zahl ist zusammengesetzt.")
        if failing_base != -1:
            print("Der Test ist gescheitert bei Basis:", failing_base)


if __name__ == "__main__":
    main()
