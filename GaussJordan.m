function [invA] = GaussJordan(A)
    n = size(A);
    A_ext = [A, eye(n)];
    
    for p = 1 : n-1
        A_ext(p+1 : n, :) = A_ext(p+1 : n, :) - A_ext(p+1 : n, p) / A_ext(p, p) * A_ext(p, :);
    endfor
    for p = n : -1 : 1
        A_ext(1 : p-1, :) = A_ext(1 : p-1, :) - A_ext(1 : p-1, p) / A_ext(p, p) * A_ext(p, :);
    endfor
    
    for p = 1 : n
        A_ext(p, :) /= A_ext(p, p);
    endfor
    invA = A_ext(1 : n, n+1 : 2*n);
endfunction