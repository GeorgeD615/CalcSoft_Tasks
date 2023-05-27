r = 0.3;
h = Snake(6,r,0);

set(gca, 'xlim',[-1 20],'ylim', [-1.5 1.5]);
axis equal
T = 0:0.01:2*pi;
x_s = 0
x_c = x_s;
y_c = sin(x_c);
x = r .* cos(T) + x_c;
y = r .* sin(T) + y_c;
while(x_s <= 20)
  for i = 1:6
    set(h(i),'XData', x, 'YData', y);
    x_c = x_c + r*pi/2;
    y_c = sin(x_c);
    x = r .* cos(T) + x_c;
    y = r .* sin(T) + y_c;
  endfor
  pause(0.05)
  title( 'SnakeSinMove' , "fontsize", 16)
  drawnow
  x_s = x_s + 0.1;
  x_c = x_s;
  
endwhile