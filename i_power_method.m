function [lambda, x, err, steps] = i_power_method(A, x0, tol, max_steps)
    steps = 0;
    prev_x = x0;

    while 1
        % Rezolvam A * x = x_prev
        [Q, R] = qr(A);
        y = Q' * prev_x;
        opt.UT = true;
        x = linsolve(R, y, opt);
        % Normam x si aflam lambda
        x = x / norm(x);
        lambda = x' * A * x;
        
        err = norm(x - prev_x);
        if (++steps == max_steps || err < tol)
            return
        endif
        
        prev_x = x;
    endwhile
endfunction