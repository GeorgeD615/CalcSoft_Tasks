set(gca, 'xlim',[-15 15],'ylim', [-15 15]);
hold on;
T = 0:0.01:2*pi;
a = 10;
b = 10;
r = 0.5;
n = 8;
h = Snake(n,r,-15,a,b);
phi_s = 0;
x_c = a*cos(phi_s);
y_c = b*sin(phi_s);
x = r .* cos(T) + x_c;
y = r .* sin(T) + y_c;
while(phi_s <= 20*pi)
  for i = 1:n
    set(h(i),'XData', x, 'YData', y);
    phi_s = phi_s + 0.1;
    x_c = a*cos(phi_s);
    y_c = b*sin(phi_s);
    x = r .* cos(T) + x_c;
    y = r .* sin(T) + y_c;
  endfor
  pause(0.1)
  title( 'SnakeCurveMove' , "fontsize", 16)
  drawnow
endwhile