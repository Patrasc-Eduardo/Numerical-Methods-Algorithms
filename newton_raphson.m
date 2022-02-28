function [r, err, steps] = newton_raphson(f, df, x0, tol, max_steps)
    steps = 0;
    r = x0;
    
    while 1
        old_r = r;
        r = r - feval(f, r) / feval(df, r);
        
        err = abs(old_r - r);
        if (++steps == max_steps || err < tol)
            return;
        endif
    endwhile
endfunction