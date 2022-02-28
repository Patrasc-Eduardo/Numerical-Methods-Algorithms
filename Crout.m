function [L, U] = Crout(A)
    n = length(A);
    L = zeros(n);
    U = eye(n);
    
    for p = 1:n
##        for i = p:n
##            L(i, p) = A(i, p) - L(i, 1:p-1) * U(1:p-1 ,p);
##        endfor
        L(p:n, p) = A(p:n, p) - L(p:n, 1:p-1) * U(1:p-1, p);
        
##        for i = p+1:n
##            U(p, i) = (A(p, i) - L(p, 1:p-1) * U(1:p-1, i)) / L(p, p);
##        endfor
        U(p, p+1:n) = (A(p, p+1:n) - L(p, 1:p-1) * U(1:p-1, p+1:n))/ L(p, p);
    endfor
    
endfunction