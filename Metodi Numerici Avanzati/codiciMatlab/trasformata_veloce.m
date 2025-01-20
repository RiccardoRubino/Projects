function F = trasformata_veloce(f)

    n = length(f);

    % Padding del vettore f con zeri fino a farne una lunghezza che sia una potenza di 2
    next_pow2 = 2^nextpow2(n); % Trova la prossima potenza di 2
    f = [f; zeros(next_pow2 - n, 1)]; % Concatenazione verticale (colonna)

    n = length(f); % Ora n è una potenza di 2

    % Caso base: se n e' 1, la FFT e' il vettore stesso
    if n == 1
        F = f;
        return;
    end

    omega_n = exp(-2i * pi / n);

    % Dividiamo il vettore in due parti: indici pari e dispari
    f_1 = f(1:2:end); % Componenti con indici pari
    f_2 = f(2:2:end);  % Componenti con indici dispari

    % Calcoliamo ricorsivamente la FFT sui sottoinsiemi
    F_1 = trasformata_veloce(f_1);
    F_2 = trasformata_veloce(f_2);

    % Ad ogni livello combino i risultati ottenuti
    F = zeros(1, n);
    for j = 0:(n/2-1)
        F(j+1) = F_1(j+1) + omega_n^j * F_2(j+1); % Parte inferiore
        F(j+1+n/2) = F_1(j+1) - omega_n^j * F_2(j+1); % Parte superiore
    end
end

