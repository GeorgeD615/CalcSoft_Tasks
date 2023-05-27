tic
y = @(x) (1 + sin(x) - cos(x)).^2 - (sin(2*x) - cos(2*x) - 0.2).^2 + 1;
e = 0.0001;

ans = [];

for k = -5:0.1:5
  x_prev = k;
  x_now = x_prev - (y(x_prev)/((y(x_prev + e) - y(x_prev))/e));
  while (abs(abs(x_now) - abs(x_prev)) >= 0.001)
    x_prev = x_now;
    x_now = x_prev - (y(x_prev)/((y(x_prev + e) - y(x_prev))/e));
  endwhile
  found = false;
  if length(ans) == 0
    if x_now <= -5 || x_now >= 5
      found = true;
    end
  end
  for i = 1:length(ans)
    if abs(abs(x_now) - abs(ans(i))) <= 0.01 || x_now <= -5 || x_now >= 5
      found = true;
      break;
    end
  end
  if (found ~= true)
    ans = [ans x_now];
  end
end

x = [-10:0.1:10];
y = 0.*x;
plot(x,y,"LineWidth", 0.5, "Color", [1,0,0]);

hold on

x = [-10:0.1:10];
y = (1 + sin(x) - cos(x)).^2 - (sin(2*x) - cos(2*x) - 0.2).^2 + 1;
plot(x,y,"LineWidth", 3,"Color", [0,0,1]);


y = @(x) (1 + sin(x) - cos(x)).^2 - (sin(2*x) - cos(2*x) - 0.2).^2 + 1;
plot(ans,y(ans),'r*',"LineWidth", 5);

ans

toc
