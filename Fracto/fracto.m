function fracto(p, ll, ur, xx, yy)
  n = length(p);
  ans = roots(p)
  f = @(x) polinom(p,x);
  df = @(x) dif_polinom(p,x);

  ll = [-2,2];
  ur = [2,-2];

  step_x = (ur(1) - ll(1))/xx;
  step_y = (ll(2) - ur(2))/yy;

  x = ll(1):step_x:ur(1);
  y = ur(2):step_y:ll(2);


  [X, Y] = meshgrid(x,y);
  Z = X + Y*i;


  for k = 1:40
    Z = Z - f(Z)./df(Z);
  end

  cm = [];
  for i = 1:(n-1)
    cm = [cm ;[rand rand rand]];
  endfor
  cm = [cm;[0 0 0]];
  colormap(cm);
  table = zeros(length(Z));
  for i = 1:length(table)
    table(i) = n;
  end

  for i = 1:length(ans)
    indexes = find(abs(Z - ans(i)) <= 0.01);
    table(indexes) = i;
  end

  image(table);
  
endfunction
