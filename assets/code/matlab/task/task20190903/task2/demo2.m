T=0:pi/200:8*pi; 

uk1_down1=0;                                          %转角起点
uk1_top1=0.820777692661297;                           %转角终点   角度自变量范围
T=uk1_down1:0.002:uk1_top1;
%% 计算交点区间pT
[deltaY, X, cY, lY] = myfun(T);
Y1 = deltaY(1:end-1);
Y2 = deltaY(2:end);
T1 = T(1:end-1);
T2 = T(2:end);
P = Y1.*Y2<0;
Tp = [T1(P)', T2(P)'];
%% 二分法求解指定精度 Tr
[m,n] = size(Tp);
Tr = zeros(m, 1);
for i = 1 : m
   Tr(i) = bisection(Tp(i,1), Tp(i,2), 1e-7); 
end

[deltaYr, Xr, cYr, lYr] = myfun(Tr);
%% 计算交点
Points = [Xr, cYr];
disp('指定区间的解如下：')
disp(Points);
%% 绘图
figure
hold on
plot(X, cY, '-b');  % 绘制渐开线
plot(X, lY, '-k');  % 绘制直线
plot(Xr, lYr, 'ro'); % 绘制交点
title(sprintf('区间内共有%d个交点', size(Points,1)));
for i = 1:size(Points, 1)
    x = Points(i,1);
    y = Points(i,2);
   text(x, y, sprintf('  p%d(%.6f,%.6f)',i, x, y));
end
axis equal 
