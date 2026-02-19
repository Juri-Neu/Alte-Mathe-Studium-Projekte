function b_n = vector_b(n) % Hier ist noch eine weitere Funktion die dazu da ist, den Vektor b zu generieren
    b_n = zeros(n, 1);
    for i = 1:n
        b_n(i) = i * 2 * pi / (n + 1);
    end
end