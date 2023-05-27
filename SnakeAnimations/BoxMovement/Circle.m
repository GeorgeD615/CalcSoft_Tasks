function retval = Circle (r, x_c,y_c)
#hold on;
T = 0:0.01:2*pi;
x = r .* cos(T) + x_c;
y = r .* sin(T) + y_c;
retval = plot(x,y);
axis equal
endfunction
