function A_n = laplace_mat(n)    
if n==1 % Okay warum diese Line und die darunter sind, erklär ich später.
    A_n = [2];
else
    A_n = zeros(n-1); % Zuerst wird eine Nullmatrix der Größe (n-1) x (n-1) erstellt. Das ist eine Spalte/Zeile zu wenig die kommt aber später
    for i = 1:n-1 % Dementsprechend läuft die Laufvariable nur bis (n-1)
        A_n(i,i) = 2; % Die Diagonale auf dieser etwas zu kleinen Nullmatrix werden nun alle 2 gesetzt.
        A_n(i,i+1) = -1; % Die obere Nebendiagonale wird nun -1 gesetzt. Und da in MATLAB, wenn in Matrizeneinträgen etwas geändernt wird, die nicht existieren, werden die einfach erschaffen und nun wird hier auch eine zusätzliche spalte generiert wodurch man eine (n-1) KREUZ n Matrix hat mit einer (2)-Diagonale im Eintrag (i,i) und (-1) rechts daneben
        A_n(i+1,i) = -1; % Die untere Nebendiagonale wird ebenfalls -1 gesetzt. Und analog wird auch eine weitere Zeile generiert. Dadurch hat man nun endlich die gewünschte n x n Form
        A_n(i+1,i+1) = 2; % Nachträglich muss noch der letzte Diagonaleintrag nochmals 2 gesetzt werden. Dieser existierte in Line 4 noch nicht.
    end % Ansich tut die Funktion genau das was in der Aufgabe steht und spuckt genau die Matrix aus wie man sie haben will. Mit Ausnahme wenn n=1 ist. Dafür ist die erste beiden Zeilen der funktion da.
end % Wenn man erwartet, dass keine 1 KREUZ 1 matrizen auftauchen, kann man auch LINE 2 bis 4 löschen.
end 