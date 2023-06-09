function dy = pendul2 (t, y, m, L)
g = 9.81;
theta1 = y(1); #���� 1
theta2 = y(2); #���� 2
p1 = y(3);     #������ 1
p2 = y(4);     #������ 2

dy(1) = 6/(m*L^2) * (2*p1 - 3*cos(theta1 - theta2)*p2)/...
        (16-9*cos(theta1 - theta2)^2);
dy(2) = 6/(m*L^2) * (8*p2-3*cos(theta1 - theta2)*p1)/...
        (16 - 9*cos(theta1 - theta2)^2);
dy(3) = -0.5*m*L^2*(dy(1)*dy(2)*sin(theta1 - theta2) + 3*g/L*sin(theta1));
dy(4) = -0.5*m*L^2*(-dy(1)*dy(2)*sin(theta1 - theta2) + g/L*sin(theta2));
dy = dy(:);
endfunction
