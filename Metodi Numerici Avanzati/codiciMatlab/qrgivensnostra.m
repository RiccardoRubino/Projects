function [Q, R] = qrgivensnostra(A)
    [m, n] = size(A);
    R = A;
    Q = eye(m);

    for j = 1 : n
        % Se la sotto-diagonale esiste, cioe' se j+1 <= m
        if j+1 <= m
            % L'unico elemento che potrebbe essere non nullo e' R(j+1, j)
            a = R(j,   j);
            b = R(j+1, j);

            [c, s] = calcolo_parametri_givens_progetto(a, b);
            G = [c -s; s c];

            % Aggiorna le 2 righe di R
            R([j, j+1], j:end) = G * R([j, j+1], j:end);

            % Aggiorna Q
            Q(:, [j, j+1]) = Q(:, [j, j+1]) * G';
        end
    end
end
