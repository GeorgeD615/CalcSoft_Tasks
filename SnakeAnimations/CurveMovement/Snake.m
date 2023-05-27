function retval = Snake (n, r,phi_s,a,b)
phi = phi_s;
x = a*cos(phi);
y = b*sin(phi);
res = [];
for i = 1:n
  res(i) = Circle(r,x,y);
  phi = phi + 0.1;
  x = a*cos(phi);
  y = b*sin(phi);
endfor
retval = res;
endfunction
