% 6.5.c und d) Man lässt das Programm laufen und untersucht die Iterationszahlen.
% für n der Form 2^k (Zweierpotenzen) und einen höheren EPS als von der
% aufgabe gefordert.
% Kurz abgelesen wobei (Jacobi | Gauss-Seidel) und n zu jeder Zeile
% verdoppelt wird, in der zweiten klammer steht um welchen faktor sich
% Jacobi | Gauss-Seidel verändert hat.
% n=4 (59 | 32) 
% n=8 (198 | 106) (3.4 | 3.3)
% n=16 (712 | 378) (3.6 | 3.6)
% n=32 (2691 | 1424) (3.8 | 3.8)
% n=64 (10448 | 5524) (3.9 | 3.9)
% n=128 (41158 | 21755) (3.9 | 3.9)
% n=256 (>80000 | >80000) 
% Ich habe es noch für andere Werte von n getestet und habe die Vermutung
% das es sich ungefähr wie folgt verhält: k(n) = b*n^a
% Man sieht durch die Stichproben: Verdoppelt sich das n, so vervierfacht
% sich k(n). Nimmt man sich nun paar sehr große werte vor => a ist ungefähr
% ~2 => b  ist ungefähr ~ 1,38