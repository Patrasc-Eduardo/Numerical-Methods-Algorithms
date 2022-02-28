function [X, l, total_steps] = orthogonal_power_method(A, tol, max_steps)
    total_steps = 0;
    X = [];
    l = [];
    n = length(A);
    
    % Pentru vectorizare, calculam prima pereche x, lambda separat
    [lam_1, x_1, ~, steps] = power_method(A, rand(n, 1), tol, max_steps);
    l = [l, lam_1];
    X = [X, x_1];
    total_steps += steps;
    
    for i = 2:n
        prev_x = rand(n, 1);
        steps = 0;
        
        while 1
            % Stergem componentele  x_1, ..., x_{i-1}
            sum = (X(:, 1:i-1)' * prev_x)';
            sum *= X(:, 1:i-1)';
            sum = sum';
            prev_x = prev_x - sum;
            
            x = A * prev_x;
            % Normam x
            x = x / norm(x);
            lambda = x' * A * x;
            
            err = norm(x - prev_x);
            if (++steps == max_steps || err < tol)
                l = [l, lambda];
                X = [X, x];
                total_steps += steps    ;
                break;
            endif
            
            prev_x = x;
        endwhile
    endfor
endfunction