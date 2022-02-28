function [X, l, total_steps] = deflation(A, tol, max_steps)
    X = [];
    l = [];
    total_steps = 0;
    n = length(A);
    A0 = A;
    
    for i = 1:n
        % Aflam aproximari bunicele ale valorii si vectorului proprii
        [lambda, x_b, ~, steps] = power_method(A, rand(length(A), 1), tol, ...
            max_steps);
        total_steps += steps;
        % Aflam aproximari mult mai bune folosind aproximarea anterioara
        [lambda, x_i, ~, steps] = s_i_power_method(A0, rand(length(A0), 1),...
            tol, max_steps, lambda + rand(1) / 1e5);
        total_steps += steps;
        X = [X, x_i];
        l = [l, lambda];
        
        v = x_b;
        v(1) += sign(x_b(1)) * norm(x_b);
        H = eye(n-i+1) - 2 * v * v' / (v' * v);
        
        A = H' * A * H;
        A = A(2:end, 2:end);
    endfor
endfunction