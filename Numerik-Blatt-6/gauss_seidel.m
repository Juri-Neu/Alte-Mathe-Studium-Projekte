function [x, k] = gauss_seidel(A, b, x, kmax, EPS)
    n = length(b);    
    for k = 1:kmax % Laufindex von 1 bis zur maximalen Iterationszahl
        for i = 1:n
            sigma = A(i, 1:i-1) * x(1:i-1) + A(i, i+1:end) * x(i+1:end); % Hier steht lediglich die Definition des Gauß-Seidel Algo. 
            x(i) = (b(i) - sigma) / A(i, i); % Der neue Lösungsvektor wird dann in der i.ten Zeile aktualisiert
        end        
        if norm(A * x - b, inf) < EPS % Abbruchkriterium: Falls x Vektor in zwei aufeinander folgenden Schritt kaum Veränderungen zeigt, also die Differenz der Norm von x(i) zu x(i+1) kleiner als ESP ist.
            break;
        end
    end
end
