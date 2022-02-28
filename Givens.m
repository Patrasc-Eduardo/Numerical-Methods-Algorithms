function [Q, R] = Givens(A)
    [m n] = size(A);
    Q = eye(m);
    R = A;
    
    for j = 1 : min(m-1, n)
        for i = j+1 : m
            r = sqrt(R(j, j) * R(j, j) + R(i, j) * R(i, j));
            c = R(j, j) / r;
            s = -R(i, j) / r;
            
            G = eye(m);
            G(j, j) = c;
            G(j, i) = -s;
            G(i, j) = s;
            G(i, i) = c;
            
            R = G * R;
            Q = G * Q;
        endfor
    endfor
    
    Q = Q';
endfunction
