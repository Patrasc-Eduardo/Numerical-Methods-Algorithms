function norm = Norm2(v)
    n = length(v);
    norm = 0;
    
    norm = v * v';
    norm = sqrt(norm);
endfunction
