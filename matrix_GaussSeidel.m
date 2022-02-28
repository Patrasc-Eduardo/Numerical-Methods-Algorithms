function [x, err, steps] = matrix_GaussSeidel(A, b, x0, tol, max_steps)
    % Aflam descompunerea in P si N
    N = tril(A);
    P = N - A;
    N = inv(N);
    
    % Aflam matricea si vectorul de iteratie
    G = N * P;
    c = N * b;
    
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