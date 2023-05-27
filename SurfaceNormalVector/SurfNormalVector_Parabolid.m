e = 0.0000001;

x0 = pi/6;
y0 = pi/6;

x = -pi:0.1:pi;
y = -pi:0.1:pi;

z0 = Paraboloid(x0,y0);

[X,Y] = meshgrid(x,y);
Z = Paraboloid(X,Y);

surf(X,Y,Z);

shading interp;
title ({"Paraboloid"});
hold on

dfdx = (Paraboloid(x0 + e, y0) - Paraboloid(x0,y0))/e
dfdy = (Paraboloid(x0, y0 + e) - Paraboloid(x0,y0))/e

vecNorm = [-dfdx, -dfdy, 1]./sqrt(dfdx^2 + dfdy^2 + 1)
origin = [x0,y0,z0];
plot3([origin(1) vecNorm(1)],[origin(2) vecNorm(2)],[origin(3) vecNorm(3)],'r-^', 'LineWidth',3);


xlabel("X")
ylabel("Y")
zlabel("Z")

grid on