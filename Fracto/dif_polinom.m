function res = dif_polinom (p, x)
k = length(p) - 1;
res = 0;
for i = 1:(length(p)-1)
  res = res .+ p(i)*k*(x.^(k-1));
  k = k - 1; 
endfor
endfunction
