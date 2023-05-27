function [dtheta_dt]=pendulEq(t,theta,b,g,l,m)
  theta1_dt=theta(1);
  theta2_dt=theta(2);
  dtheta1=theta2_dt;
  dtheta2=(-(b/m)*theta2_dt)-((g/l)*sin(theta1_dt));
  dtheta_dt=[dtheta1;dtheta2];
endfunction
