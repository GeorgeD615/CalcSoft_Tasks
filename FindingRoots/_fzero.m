tic
f = @(x) x.^2 - 1;
fzero(f, -1);
fzero(f, 2);

x = [-10:0.1:10];
y = 0.*x;
plot(x,y,"LineWidth", 0.5, "Color", [1,0,0]);

hold on


x = [-10:0.1:10];
y = (1 + sin(x) - cos(x)).^2 - (sin(2*x) - cos(2*x) - 0.2).^2 + 1;
plot(x,y,"LineWidth", 3, "Color", [0,0,1]);



y = @(x) (1 + sin(x) - cos(x)).^2 - (sin(2*x) - cos(2*x) - 0.2).^2 + 1;
x_prev = fzero(y, -4.9);
ans = [x_prev];
for k = -5:0.1:5
  x_now = fzero(y,k);
  found = false;
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

plot(ans,y(ans),'r*',"Color", [1,0,0],"LineWidth", 5);

grid on

ans

toc