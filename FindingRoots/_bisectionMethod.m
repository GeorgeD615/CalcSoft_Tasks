tic
y = @(x) (1 + sin(x) - cos(x)).^2 - (sin(2*x) - cos(2*x) - 0.2).^2 + 1;

ans = [];

e = 0.0001;

for k = -4.8:0.2:5
  a = k-0.2;
  b = k;
  if (sign(y(a)) == sign(y(b)))
    continue;
  endif
  y1 = y(a);
  while (true)
    x = (a + b)/2;
    y0 = y(x);
    if (abs(b - a) < e) || (y0 == 0)
      break;
    endif
    if (y0 * y1 < 0)
      b = x;
    else 
      a = x;
    endif
  endwhile
  found = false;
  if length(ans) == 0
    if x <= -5 || x >= 5
      found = true;
    end
  end
  for i = 1:length(ans)
    if abs(abs(x) - abs(ans(i))) <= 0.01 || x <= -5 || x >= 5
      found = true;
      break;
    end
  end
  if (found ~= true)
    ans = [ans x];
  end
end

x = [-10:0.1:10];
y = (1 + sin(x) - cos(x)).^2 - (sin(2*x) - cos(2*x) - 0.2).^2 + 1;
plot(x,y,"LineWidth", 3,"Color", [0,0,1]);

hold on

x = [-10:0.1:10];
y = 0.*x;
plot(x,y,"LineWidth", 0.5, "Color", [1,0,0]);


y = @(x) (1 + sin(x) - cos(x)).^2 - (sin(2*x) - cos(2*x) - 0.2).^2 + 1;
plot(ans,y(ans),'r*',"LineWidth", 5,"Color", [1,0,0]);

ans

toc