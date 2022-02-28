function [R, x] = G(A, b)
    % Eliminare Gaussiana simpla
    A_ext = [A, b];
    [n, m] = size(A_ext);
    
    for p = 1 : n-1
		A_ext(p+1 : n, :) = A_ext(p+1 : n, :) - A_ext(p+1 : n, p) / A_ext(p, p) * A_ext(p, :);
	endfor

    R = A_ext(:, 1:m-1);
	x = A_ext(:, m);
	x = SST(R, x);
endfunction