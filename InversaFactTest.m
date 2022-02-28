function [B] = InversaFactTest(A)
    n = length(A);
    B = [];
    [L, U] = Crout(A);
    % Matricea de permutare
    P = eye(n);
    P = [P(n, :) ; P(1:(n-1), :)];
    % Primul vector ce este componenta a lui eye(n)
    v = zeros(n, 1);
    v(1,1) = 1;
    
    for i = 1:n
        y = SIT(L, v);
        x = SST(U, y);
        B = [B, x];
        
        % Mutam 1 din vectorul v cu o pozitie mai jos
        v = P * v;
    endfor
endfunction
