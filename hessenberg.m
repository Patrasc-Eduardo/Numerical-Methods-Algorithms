function [R_] = hessenberg(A)
    % Reducerea lui A la tridiagonala cu Hh
    n = length(A);
    Q = eye(n);
    for i = 1:n-2
        v = zeros(n, 1);
        sgn = sign(A(i+1, i));
        if (sgn == 0)
            sgn = 1;
        endif
        
        v(i+1) = A(i+1, i) + sgn * norm(A(i+1:n, i));
        v(i+2:n) = A(i+2:n, i);
        
        H = eye(n) - 2 * v * v' / (v' * v);
        A = H * A * H';
    endfor
    
    R_ = A;
endfunction