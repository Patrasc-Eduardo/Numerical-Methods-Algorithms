function [r, err, steps] = secant(f, x0, x1, tol, max_steps)
    steps = 0;
    % x - aproximarea veche; r - arpoximarea noua
    r = x1;
    x = x0;
    
    while 1
        old_r = r;
        r = r - (x-r) / (feval(f, x) - feval(f, r)) * feval(f, r);
        x = old_r;

        err = abs(r - old_r);
        if (++steps == max_steps || err < tol)
            return;
        endif
    endwhile
endfunction