% Programmieraufgabe 6.5
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1. Neu, Juri 3163240
%
% Programmiersprache:
% Version: '23.2.0.2391609 (R2023b) Update 2'
%
% Liste der eingesendeten Dateien:
%   1. jacobi.m (Aufgabe 5.5.a) 
%   2. gauss_seidel.m (Aufgabe 5.5.b)
%   3. laplace_mat.m (Aufgabe 6.5.a)
%   4. vector_b.m (Aufgabe 6.5.b)
%   5. pa_6_5.m (Aufgabe 6.5.b)
%   6. dokumentation.m (Aufgabe 6.5.c und 6.5.d)
%
% Hier folgt nun das Skript, welches alle Programme zu den Aufgabenteilen
% ausfuehrt. 

% Beim Drücken von Run wird im Command Window dann A_n * x = b gelöst für
% n = 2^i − 1, i = 2, . . . , 5 und b_n = [ cos(1 * 2 * pi / (n+1) ; cos(2
% * 2 * pi / (n+1) ....... cos(n * 2 * pi /n+1) ]
n_values = [3, 7, 15, 31, 63];
for i = 1:length(n_values)
    n = n_values(i);
A=laplace_mat(n);
b=vector_b(n);
kmax=100000;
EPS=0.00001;
x0 = zeros(n, 1);

[x_jacobi, k_jacobi] = jacobi(A, b, x0, kmax, EPS);
[x_gauss_seidel, k_gauss_seidel] = gauss_seidel(A, b, x0, kmax, EPS);

% Präsentiere Antworten
disp("Für den Fall dass n =");
disp(n)
disp("Jacobi-Verfahren:");
disp("Lösungsvektor x:");
disp(x_jacobi);
disp("Anzahl Iterationen:");
disp(k_jacobi); 

disp("Gauß-Seidel-Verfahren:");
disp("Lösungsvektor x:");
disp(x_gauss_seidel);
disp("Anzahl Iterationen:");
disp(k_gauss_seidel);
end