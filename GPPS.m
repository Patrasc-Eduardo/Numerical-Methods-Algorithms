function [R, x] = GPPS(A, b)
    % Eliminare Gaussiana cu pivotare partiala scalata
    A_ext = [A, b];
    [n, m] = size(A_ext);
    
    for p = 1 : n-1
        % Gasim linia pe care modulul "pivotului" scalat e maxim
        k = p;
        s_k = norm(A_ext(k, 1 : m-1), 1);
        for i = p+1 : n
            s_i = norm(A_ext(i, 1 : m-1), 1);
            if abs(A_ext(i, p)) / s_i > abs(A_ext(k, p)) / s_k
                k = i;
                s_k = s_i;
            endif
        endfor
        % Interschimbam liniile k si p
        v = A_ext(p, :);
        A_ext(p, :) = A_ext(k, :);
        A_ext(k, :) = v;
        
		A_ext(p+1 : n, :) = A_ext(p+1 : n, :) - A_ext(p+1 : n, p) / A_ext(p, p) * A_ext(p, :);
	endfor

    R = A_ext(:, 1:m-1);
	x = A_ext(:, m);
	x = SST(R, x);
endfunction