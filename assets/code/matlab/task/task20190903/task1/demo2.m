%% 计算交点区间pT 
t_start = 0;
t_end=8*pi;
step = pi/200;
[deltaY, X, cY, lY] = myfun(t_start:step:t_end);

%% 计算交点
Tr = fzeros(@myfun, t_start, t_end, step, 1e-8);
[deltaYr, Xr, cYr, lYr] = myfun(Tr);
Intersections = [Xr, cYr];
disp('指定区间的解如下：')
X = Xr;
Y = cYr;
disp(table(Tr, X,Y));
%% 绘图
figure; 
hold on;
axis equal;

plot(X, cY, '-b');  % 绘制渐开线
plot(X, lY, '-k');    % 绘制直线
plot(Xr, lYr, 'ro'); % 绘制交点
for i = 1:size(Intersections, 1)   % 交点坐标
    x = Intersections(i,1);
    y = Intersections(i,2);
   text(x, y, sprintf('  p%d(%.6f,%.6f)',i, x, y));
end
title(sprintf('区间内共有%d个交点', size(Intersections,1)));

