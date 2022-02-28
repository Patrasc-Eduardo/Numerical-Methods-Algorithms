function [x, err, steps] = matrix_SOR(A, b, x0, tol, max_steps, w)
    % Descompunem A in D+L+U
    D = diag(diag(A));
    L = tril(A, -1);
    U = A - D - L;
    % Aflam P si inv lui N
    N = D + w * L;
    P = (1-w) * D - w * U;
    N = inv(N);
    % Aflam matricea si vectorul de iteratie
    G = N * P;
    c = w * N * b;
    
    steps = 0;
    x_prev = x0;
    % Cautam solutia
    while 1
        x = G * x_prev + c;
        
        err = norm(x - x_prev);
        if (++steps == max_steps || err < tol)
            return;
        endif
        
        x_prev = x;
    endwhile
endfunction