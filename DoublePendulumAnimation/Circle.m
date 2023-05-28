function retval = Circle (r, x_c,y_c,color)
T = 0:0.01:2*pi;
x = r .* cos(T) + x_c;
y = r .* sin(T) + y_c;
retval = plot(x,y,'LineWidth',10,'Color',color);
axis equal
endfunction
