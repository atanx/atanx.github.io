T=0:pi/200:8*pi; 

uk1_down1=0;                                          %ת�����
uk1_top1=0.820777692661297;                           %ת���յ�   �Ƕ��Ա�����Χ
T=uk1_down1:0.002:uk1_top1;
%% ���㽻������pT
[deltaY, X, cY, lY] = myfun(T);
Y1 = deltaY(1:end-1);
Y2 = deltaY(2:end);
T1 = T(1:end-1);
T2 = T(2:end);
P = Y1.*Y2<0;
Tp = [T1(P)', T2(P)'];
%% ���ַ����ָ������ Tr
[m,n] = size(Tp);
Tr = zeros(m, 1);
for i = 1 : m
   Tr(i) = bisection(Tp(i,1), Tp(i,2), 1e-7); 
end

[deltaYr, Xr, cYr, lYr] = myfun(Tr);
%% ���㽻��
Points = [Xr, cYr];
disp('ָ������Ľ����£�')
disp(Points);
%% ��ͼ
figure
hold on
plot(X, cY, '-b');  % ���ƽ�����
plot(X, lY, '-k');  % ����ֱ��
plot(Xr, lYr, 'ro'); % ���ƽ���
title(sprintf('�����ڹ���%d������', size(Points,1)));
for i = 1:size(Points, 1)
    x = Points(i,1);
    y = Points(i,2);
   text(x, y, sprintf('  p%d(%.6f,%.6f)',i, x, y));
end
axis equal 
