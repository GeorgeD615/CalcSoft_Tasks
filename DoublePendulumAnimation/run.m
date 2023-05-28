#input 
m = 3;
L = 2;
theta1 = 3*pi/4;
theta2 = 3*pi/8;
t = 0:0.1:20;

#solving ODE
[T, Y] = ode45(@(t,x) pendul2(t,x,m,L),...
  t,[theta1, theta2, 0,0])
#calculating joint coordinates 
x = [L*sin(Y(:,1)), L*sin(Y(:,1))+L*sin(Y(:,2))];
y = [-L*cos(Y(:,1)), -L*cos(Y(:,1))-L*cos(Y(:,2))];
#convert radians to degrees
ang = Y(:,1:2)*180/pi;


hold on;
set(gca, 'xlim',[-2*L 2*L],'ylim', [-2*L L]);


hh2 = plot([0, x(1,1);x(1,1),x(1,2)],[0,y(1,1);y(1,1),y(1,2)],'LineWidth',2,'Color',[0, 0, 0]);

r1 = 0.1;
B1 = Circle(r1, x(1,1),y(1,1),[1,0,0]);

r2 = 0.1;
B2 = Circle(r2, x(1,2),y(1,2),[0,0,1]);

T = 0:0.01:2*pi;
for i = 2:length(T)
  set(hh2(1), 'XData', [0,x(i,1)], 'YData',[0,y(i,1)]);
  x_c = x(i,1);
  y_c = y(i,1);
  x_circ = r1 .* cos(T) + x_c;
  y_circ = r1 .* sin(T) + y_c;
  set(B1, 'XData', x_circ, 'YData',y_circ);
  plot([x(i-1,1), x(i,1)],[y(i-1,1), y(i,1)], 'LineWidth',1, 'Color',[1,0,0]);
  
  set(hh2(2), 'XData', x(i,:), 'YData',y(i,:));
  x_c = x(i,2);
  y_c = y(i,2);
  x_circ = r2 .* cos(T) + x_c;
  y_circ = r2 .* sin(T) + y_c;
  set(B2, 'XData', x_circ, 'YData',y_circ);
  plot([x(i-1,2), x(i,2)],[y(i-1,2), y(i,2)], 'LineWidth',1, 'Color',[0,0,1]);
  pause(0.1);
endfor