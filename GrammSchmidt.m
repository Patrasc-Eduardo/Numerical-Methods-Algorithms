function [Q, R] = GrammSchmidt(A)
    n = length(A);
    R = zeros(n);
    Q = zeros(n);
    
    for i = 1 : n
        % R(i, i) = Norm2(A(:, i)'); I was young and clueless
        R(i, i) = norm(A(:, i)');
        Q(:, i) = A(:, i) / R(i, i);
        for j = i+1 : n
            R(i, j) = Q(:,i)' * A(:, j);
            A(:, j) = A(:, j) - Q(:, i) * R(i, j);
        endfor
    endfor
endfunction
