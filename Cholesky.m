function L = Cholesky(A)
    n = size(A);
    
    % Putem aplica Cholesky?
    if !isequal(A, A')
        L = NaN;
        return
    endif
    for i = 1:n
        if det(A(1:i, 1:i)) == 0
            L = NaN;
            return
        endif
    endfor
    % Putem!
    L = zeros(n);
    
    for i = 1:n
        for j = 1:i-1
            L(i, j) = (A(i, j) - L(i, 1:j-1) * L(j, 1:j-1)') / L(j, j);
            % Vectorizarea nu merge ?
##            L(i, j) = A(i, j);
##            for k = 1:j-1
##                L(i, j) -= L(i, k) * L(j, k);
##            endfor
##            L(i, j) /= L(j, j);
        endfor
        L(i, i) = sqrt(A(i, i) - L(i, 1:i-1) * L(i, 1:i-1)');
    endfor
    
endfunction
