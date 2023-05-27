function retval = Snake (n, r,x_s)
figure 
hold on
x = x_s;
y = sin(x);
res = [];
for i = 1:n
  res(i) = Circle(r,x,y);
  x = x + r*pi/2;
  y = sin(x);
endfor
retval = res;
endfunction
