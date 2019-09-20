%% ���㽻������pT 
t_start = 0;
t_end=8*pi;
step = pi/200;
[deltaY, X0, cY, lY] = algorithms.myfun(t_start:step:t_end);

%% ���㽻��
Tr = algorithms.fzeros(@algorithms.myfun, t_start, t_end, step, 1e-8);
[deltaYr, Xr, cYr, lYr] = algorithms.myfun(Tr);
Intersections = [Xr, cYr];
disp('ָ������Ľ����£�')
X = Xr;
Y = cYr;
disp(table(Tr, X, Y));
%% ��ͼ
figure; 
hold on;
axis equal;

plot(X0, cY, '-b');  % ���ƽ�����
plot(X0, lY, '-k');    % ����ֱ��
plot(Xr, lYr, 'ro'); % ���ƽ���
for i = 1:size(Intersections, 1)   % ��������
    x = Intersections(i,1);
    y = Intersections(i,2);
   text(x, y, sprintf('  p%d(%.6f,%.6f)',i, x, y));
end
title(sprintf('�����ڹ���%d������', size(Intersections,1)));

