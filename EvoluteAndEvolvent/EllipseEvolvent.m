function [x,y] = EllipseEvolvent (t,a,b)
x = a.*(cos(t) + t.*(sin(t)));
y = b.*(sin(t) - t.*(cos(t)));
endfunction
