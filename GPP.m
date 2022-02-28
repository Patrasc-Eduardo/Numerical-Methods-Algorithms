function [R, x] = GPP(A, b)
    % Eliminare Gaussiana cu pivotare partiala
	A_ext = [A, b];
    [n, m] = size(A_ext);
	
	for p = 1 : n-1
        % Gasim linia pe care modulul "pivotului" e maxim
        k = p;
        for i = p+1 : n
            if abs(A_ext(i, p)) > abs(A_ext(k, p))
                k = i;
            endif
        endfor
        % Interschimbam liniile p si k
        v = A_ext(p, :);
        A_ext(p, :) = A_ext(k, :);
        A_ext(k, :) = v;
        
        A_ext(p+1 : n, :) = A_ext(p+1 : n, :) - A_ext(p+1 : n, p) / A_ext(p, p) * A_ext(p, :);
	endfor	
	
	R = A_ext(:, 1:m-1);
	x = A_ext(:, m);
	x = SST(R, x);
endfunction