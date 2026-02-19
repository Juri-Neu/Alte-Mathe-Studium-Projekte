n = int(input("n eingeben: "))
e = int(input("e eingeben: "))
i = 2
p = 0
q = 0
while i * i <= n:
    if n % i == 0:
        p = i
        q = n // i
        break
    i = i + 1
if p == 0:
    print("n lässt sich nicht Faktorisiern")
else:
    print("Faktoren gefunden:")
    print("p =", p)
    print("q =", q)
    phi = (p - 1) * (q - 1)
    print("phi =", phi)
    d = 1
    gefunden = False
    while d < phi:
        if (d * e) % phi == 1:
            gefunden = True
            break
        d = d + 1
    if gefunden:
        print("Privater Schlüssel d =", d)
    else:
        print("Kein d gefunden")

########### ähnlich wie bei anderen Projekt steht oben lediglich mein code von früher
######## heute würde ich das so machen:
#
# Beispiel:
# n = 4000064000087 ;;; e = 65537

import time
from typing import Tuple, Optional

def factorize(n: int) -> Optional[Tuple[int, int]]:
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return i, n // i
    return None

def extended_gcd(a: int, b: int) -> Tuple[int, int, int]:
    if b == 0:
        return a, 1, 0
    gcd, x1, y1 = extended_gcd(b, a % b)
    x = y1
    y = x1 - (a // b) * y1
    return gcd, x, y

def mod_inverse(e: int, phi: int) -> Optional[int]:
    gcd, x, _ = extended_gcd(e, phi)
    if gcd != 1:
        return None
    return x % phi

def main():
    print("RSA Brute Force - privaten Schlüssel bestimmen")
    print("(Nur für kleinere n (<10^15) geeignet!)\n")
    n = int(input("n eingeben: "))
    e = int(input("e eingeben: "))

    start_time = time.time()
    factors = factorize(n)

    if factors is None:
        print("\nFaktorisierung fehlgeschlagen.")
        return

    p, q = factors
    print("\nFaktoren gefunden:")
    print("p =", p)
    print("q =", q)

    phi = (p - 1) * (q - 1)
    print("phi(n) =", phi)

    d = mod_inverse(e, phi)

    if d is None:
        print("Kein modulares Inverses gefunden.")
        return

    print("Privater Schlüssel d =", d)

    end_time = time.time()
    print("Laufzeit:", round(end_time - start_time, 4), "Sekunden")

if __name__ == "__main__":
    main()

