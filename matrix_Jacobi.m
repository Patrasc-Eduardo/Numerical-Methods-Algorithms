function [x, err, steps] = matrix_Jacobi(A, b, x0, tol, max_steps)
    % Aflam P
    aux = diag(A);
    N = diag(aux);
    P = N - A;
    % Aflam inversul lui N
    aux = 1 ./ aux;
    N = diag(aux);
    % Cream matricea si vectorul de iteratie
    G = N * P;
    c = N * b;
    
    steps = 0;
    prev_x = x0;
    % Cautam solutia
    while 1
        x = G * prev_x + c;

        err = norm(x - prev_x);
        if (++steps == max_steps || err < tol)
            return;
        endif
        
        prev_x = x;
    endwhile
endfunction