function [eigenvalues, eigenvectors] = qr_hessenberg_shift(A)
    if nargin < 2
        max_iterations = 10000;
    end
    
    tol = 1e-5;
    [P, H] = hess(A);
    
    n = size(H, 1);
    V = eye(n); 
    
    for iter = 1:max_iterations
        m = n;
        while m > 1
            if abs(H(m, m-1)) < tol * (abs(H(m-1, m-1)) + abs(H(m, m)))
                m = m - 1;
            else
                break;
            end
        end
        
        mu = wilkinson_shift(H(max(1,m-1):m, max(1,m-1):m));
        
        [Q, R] = qrgivensnostra(H - mu * eye(n));
        
        H_new = R * Q + mu * eye(n);
        V = V * Q;
        
        if norm(H - H_new, 'inf') < tol
            break;
        end
        
        H = H_new;
        
    end
    
    eigenvalues = diag(H);
    
    eigenvectors = P * V;
    
    for i = 1:n
        eigenvectors(:,i) = eigenvectors(:,i) / norm(eigenvectors(:,i));
    end
    disp(iter);
end

function mu = wilkinson_shift(submatrix)
    % Calcolo dello shift di Wilkinson per matrici 2x2 o più piccole
    if size(submatrix, 1) == 1
        mu = submatrix;
        return;
    end
    
    if size(submatrix, 1) == 2
        a = submatrix(1,1);
        b = submatrix(1,2);
        c = submatrix(2,1);
        d = submatrix(2,2);
        
        % Calcolo del discriminante
        disc = sqrt((a + d)^2 - 4 * (a*d - b*c));
        
        % Selezione dello shift
        if abs(a + d + disc) > abs(a + d - disc)
            mu = a + d - disc;
        else
            mu = a + d + disc;
        end
    else
        % Per matrici più grandi, usa l'ultimo elemento come shift
        mu = submatrix(end, end);
    end
end
