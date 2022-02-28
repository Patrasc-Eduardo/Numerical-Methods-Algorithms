function [Q R] = Householder(A)
    [m n] = size(A);
    Q = eye(m);
    
    for i = 1 : min(m-1, n)
        v = zeros(m, 1);
        sgn = -sign(A(i, i));
        if (sgn == 0)
            sgn = 1;
        endif
            
        v(i) = A(i, i) + sgn * norm(A(i : m, i)');
        v(i+1 : m) = A(i+1 : m, i);
        
        H = eye(m) - 2 * v * v' / (v' * v)
        
        A = H * A;
        Q = H * Q;
    endfor
    
    Q = Q';
    R = A;
endfunction
