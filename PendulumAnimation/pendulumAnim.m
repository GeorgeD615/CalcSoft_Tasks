clc;
clear;
b=0.05;
g=9.81;
l=8;
m=0.2;
theta0=[0;5];
tspan=0:0.2:40;
[t,result]=ode45(@(t,theta) pendulEq(t,theta,b,g,l,m),tspan,theta0);
set(gca, 'xlim',[-(l+2) (l+2)],'ylim', [-(l+2) 2]);
hold on;
plot([-0.5 0.5],[0 0],'linewidth',5,'color',[0,0,1]);
pend = plot([0 0],[0 0],'linewidth',2,'color',[0,1,0]);
r = 1.5;
circle = Circle(r,0,0);
R=result(:,1);
T = 0:0.01:2*pi;
for i=1:length(R)
    R1=R(i);
    x1=l*sin(R1);
    y1=-l*cos(R1);
    x = r .* cos(T) + x1;
    y = r .* sin(T) + y1;
    set(circle, 'XData', x, 'YData', y);
    x = [0 x1];
    y = [0 y1];
    set(pend, 'XData', x, 'YData', y);
    grid on;
    pause(0.1)
endfor

