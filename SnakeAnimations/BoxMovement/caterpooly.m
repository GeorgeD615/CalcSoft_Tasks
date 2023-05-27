function retval = caterpooly (start, velocity, lu, rd, iter)
  start = start./norm(start);
  direction = start;
  #x1 = lu(1);
  #x2 = rd(1);
  #y1 = rd(2);
  #y2 = lu(2);
  set(gca, 'xlim',[lu(1) rd(1)],'ylim', [rd(2) lu(2)]);
  title( 'SnakeBoxMove' , "fontsize", 16);
  hold on;
  #plot([0,start(1)],[0, start(2)],'LineWidth',3,'Color',[0,0,1]);
  r = 0.5;
  n = 6;
  box = drawBox(lu, rd);
  snake = Snake(n,r,direction);
  T = 0:0.01:2*pi;
  x_c = 0;
  y_c = 0;
  x = r .* cos(T) + x_c;
  y = r .* sin(T) + y_c;
  prev_pos = [x_c, y_c];
  for i = 1:iter
    for i = 1:n
      set(snake(i), 'XData', x, 'YData', y);
      x_c = x_c + direction(1)*2*r;
      y_c = y_c + direction(2)*2*r;
      if(i == 1)
        plot([prev_pos(1),x_c],[prev_pos(2), y_c],'LineWidth',1,'Color',[0,0,1]);
        prev_pos = [x_c, y_c];
      endif
      x = r .* cos(T) + x_c;
      y = r .* sin(T) + y_c;
      if(x_c <= lu(1) + r)
        direction = direction - 2 .* (direction * [1;0]).*[1,0];
        direction = direction./norm(direction);
      endif
      if(x_c >= rd(1) - r)
        direction = direction - 2 .* (direction * [-1;0]).*[-1,0];
        direction = direction./norm(direction);
      endif
      if(y_c <= rd(2) + r)
        direction = direction - 2 .* (direction * [0;1]).*[0,1];
        direction = direction./norm(direction);
      endif
      if(y_c >= lu(2) - r)
        direction = direction - 2 .* (direction * [0;-1]).*[0,-1];
        direction = direction./norm(direction);
      endif
    endfor
    pause(1/norm(velocity));
  endfor
endfunction
