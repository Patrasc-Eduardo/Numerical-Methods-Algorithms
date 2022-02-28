function [values] = taylor_1(df, t0, x0, h, N)
    values = [x0];
    t = t0;
    x = x0;
    
    for i = 1:N
        % Aplicam dezvoltarea Taylor cu 1 componenta
        x = x + h * df(t, x);
        
        values = [values, x];
        t += h;
    endfor
endfunction