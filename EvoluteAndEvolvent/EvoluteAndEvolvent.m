set(gca, 'xlim',[-10 10],'ylim', [-10 10]);
T = 0:0.1:(2*pi+0.1);
a = 2;
b = 1;
hold on;
[x,y] = Ellipse(T,a,b);
plot(x,y,'LineWidth',2,'Color',[0,0,1]);

[ElX, ElY] = EllipseEvolute(T,a,b);
[EvX, EvY] = EllipseEvolvent(T,a,b);


for i = 2:length(T)
  plot([ElX(i-1),ElX(i)],[ElY(i-1),ElY(i)],'LineWidth',2,'Color',[1,0,0])
  plot([EvX(i-1),EvX(i)],[EvY(i-1),EvY(i)],'LineWidth',2,'Color',[0,1,0])
  pause(0.1);
endfor

