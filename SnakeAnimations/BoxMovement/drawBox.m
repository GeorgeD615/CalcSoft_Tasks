function retval = drawBox (lu, rd)
  x1 = lu(1);
  x2 = rd(1);
  y1 = rd(2);
  y2 = lu(2);
  res = [];
  #hold on;
  res(1) = plot([x1,y1],[x2,y1],'LineWidth',3,'Color',[1,0,0]);
  res(2) = plot([x2,y1],[x2,y2],'LineWidth',3,'Color',[1,0,0]);
  res(3) = plot([x2,y2],[x1,y2],'LineWidth',3,'Color',[1,0,0]);
  res(4) = plot([x1,y2],[x1,y1],'LineWidth',3,'Color',[1,0,0]);
  retval = res;
endfunction
