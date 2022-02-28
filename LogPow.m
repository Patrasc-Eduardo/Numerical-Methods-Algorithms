function y = LogPow(x, p)
    if (p == 1)
        y = x;
    else
        if (mod(p, 2)  == 0)
            aux = LogPow(x, p/2);
            y = aux .* aux;
        else
            y = x .* LogPow(x, p-1);
        endif
    endif
endfunction
