function [values] = taylor_2(df, dfdt, dfdx, t0, x0, h, N)
    values = [x0];
    t = t0;
    x = x0;
    
    for i = 1:N
        f = df(t, x);
        % Aplicam dezvoltarea Taylor cu 2 termeni
        x = x + h * f + 0.5 * h * h * (dfdt(t, x) + dfdx(t, x) * f);
        
        values = [values, x];
        t += h;
    endfor
endfunction 