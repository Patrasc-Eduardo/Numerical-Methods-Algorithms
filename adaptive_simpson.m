function [S, points] = adaptive_simpson (f, a, b, tol)
  s1 = simpson(f, a, b, 1);
  c = (a + b) / 2;
  s2 = simpson(f, a, c, 1) + simpson(f, c, b, 1);
  
  if abs(s2 - s1) < 15 * tol
    S = s2 + (s2 - s1) / 15;
   else
    disp("SPLIT")
    left = adaptive_simpson(f, a, c, tol / 2);
    right = adaptive_simpson(f, c, b, tol / 2);
    S = left + right;
  endif
endfunction