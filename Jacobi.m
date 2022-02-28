function [x, err, steps] = Jacobi(A, b, x0, tol, max_steps)
    prev_x = x0;
    x = prev_x;
    n = length(x);
    steps = 0;
    
    while 1
        % Calculam noua aproximare a lui x
        x = (b - A * prev_x + diag(A) .* prev_x) ./ diag(A);
        
        err = norm(x - prev_x);
        if (++steps == max_steps || err < tol)
            return;
        endif
        
        prev_x = x;
    endwhile
endfunction