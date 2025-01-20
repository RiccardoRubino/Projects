function [U, S, V] = svd_qr_hessenberg_shift(A)
    AtA = A' * A;
    
    [eigvals, eigvecs] = qr_hessenberg_shift(AtA);
    
    singular_values = sqrt(abs(eigvals));
    
    % Ordina i valori singolari in ordine decrescente
    [sorted_singular_values, idx] = sort(singular_values, 'descend');
    
    % Ordina anche le colonne di V in base agli indici ordinati
    V = eigvecs(:, idx);
    
    S = diag(sorted_singular_values);
    
    % Calcolare U come A * V * inv(S)
    U = A * V / S;
    
    % Normalizzare U
    for i = 1:size(U, 2)
        U(:, i) = U(:, i) / norm(U(:, i));
    end
end
