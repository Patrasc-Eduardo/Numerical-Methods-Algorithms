function [R, x] = GPT(A, b)
    % Eliminare Gaussiana cu pivotare totala
	A_ext = [A, b];
    [n, m] = size(A_ext);
    x_swap = eye(length(b));
	
	for p = 1 : n-1
        % Gasim maximul submatricei A_ext(p:n, 1:m-1)
        l = p;
        k = p;
        for i = p : n
            for j = p : m-1
                if abs(A_ext(i, j)) > abs(A_ext(l, k))
                    l = i;
                    k = j;
                endif
            endfor
        endfor
        % Interschimbam liniile p si l
        v = A_ext(p, :);
        A_ext(p, :) = A_ext(l, :);
        A_ext(l, :) = v;
        % Interschimbam coloanele p si k
        w = A_ext(:, p);
        A_ext(:, p) = A_ext(:, k);
        A_ext(:, k) = w;
        % Matrice ce tine cont de cum au fost interschimbate coloanele
        v = x_swap(:, p);
        x_swap(:, p) = x_swap(:, k);
        x_swap(:, k) = v;
        
        A_ext(p+1 : n, :) = A_ext(p+1 : n, :) - A_ext(p+1 : n, p) / A_ext(p, p) * A_ext(p, :);
	endfor	
	
	R = A_ext(:, 1:m-1);
	x = A_ext(:, m);
	x = SST(R, x);
    x = x_swap * x;
endfunction