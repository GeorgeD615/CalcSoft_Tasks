function retval = Snake (n,r,dir)
x = 0;
y = 0;
res = [];
for i = 1:n
  res(i) = Circle(r,x,y);
  x = x + dir(1)*2*r;
  y = y + dir(2)*2*r;
endfor
retval = res;
endfunction
