function res = polinom (p, x)
k = length(p) - 1;
res = 0;
for i = 1:length(p)
  res = res .+ p(i).*(x.^k);
  k = k - 1; 
endfor
endfunction
