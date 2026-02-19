function [x, k] = jacobi(A, b, x, kmax, EPS)
    n = length(b);    
    for k = 1:kmax % Laufindex von 1 bis zur maximalen Iterationszahl
        x_new = zeros(n, 1); % Erzeuge neuen n-dimensionalen Nullvektor        
        for i = 1:n
            sigma = A(i, :) * x - A(i, i) * x(i); % Hier steht lediglich die Definition des Algorithmus: Damit nimmt er den Startvektor x und passt  
            x_new(i) = (b(i) - sigma) / A(i, i); % Der neue (und damit hoffentlich am tatsächlich Lösungvektor x) vektor wird in der i.ten Zeile angepasst.
        end        
        if norm(x_new - x, inf) < EPS % Abbruchkriterium: Falls x Vektor in zwei aufeinander folgenden Schritt kaum Veränderungen zeigt, also die Differenz der Norm von x(i) zu x(i+1) kleiner als ESP ist.
            break;
        end        
        x = x_new;
    end
end
