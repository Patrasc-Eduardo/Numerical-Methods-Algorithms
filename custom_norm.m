function y = custom_norm(x, p)
    n = length(x);
    y = 0;

    if (p == inf)
        y = max(x);
    else
        for i = 1 : n;
            y += LogPow(abs(x(i)), p);
        endfor
        
        y = nthroot(y, p);
    endif 
endfunction
