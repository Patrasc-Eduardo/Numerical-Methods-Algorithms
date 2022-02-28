function [x, err, steps] = SOR(A, b, x0, tol, max_steps, w)
    steps = 0;
    x_prev = x0;
    x = x_prev;
    n = length(x);
    
    % Cautam solutia
    while 1
        for i = 1:n
            sum1 = A(i, 1:(i-1)) * x(1:(i-1));
            sum2 = A(i, (i+1):n) * x_prev((i+1):n);
            x(i) = (1-w) * x(i) + w * (b(i) - sum1 - sum2) ./ A(i, i);
        endfor
        
        err = norm(x - x_prev);
        if (++steps == max_steps || err < tol)
            return;
        endif
        
        x_prev = x;
    endwhile
endfunction