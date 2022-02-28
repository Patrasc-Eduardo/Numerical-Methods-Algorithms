function [P] = newton(x, y)
    n = length(x);
    P = [];

    for i = 1:n
        P = [newton_helper(x, y, 1, i), P];
    endfor
endfunction

% Functie care calculeaza recursiv coeficientul f[x_start, ..., x_stop]
function [b] = newton_helper(x, y, start, stop)
    if (start == stop)
        b = y(start);
    else
        b = (newton_helper(x, y, start+1, stop) - newton_helper(x, y, ...
            start, stop-1)) ./ (x(stop) - x(start));
    endif
endfunction