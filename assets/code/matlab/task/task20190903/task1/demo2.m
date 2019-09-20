%% ���㽻������pT 
t_start = 0;
t_end=8*pi;
step = pi/200;
[deltaY, X, cY, lY] = myfun(t_start:step:t_end);

%% ���㽻��
Tr = fzeros(@myfun, t_start, t_end, step, 1e-8);
[deltaYr, Xr, cYr, lYr] = myfun(Tr);
Intersections = [Xr, cYr];
disp('ָ������Ľ����£�')
X = Xr;
Y = cYr;
disp(table(Tr, X,Y));
%% ��ͼ
figure; 
hold on;
axis equal;

plot(X, cY, '-b');  % ���ƽ�����
plot(X, lY, '-k');    % ����ֱ��
plot(Xr, lYr, 'ro'); % ���ƽ���
for i = 1:size(Intersections, 1)   % ��������
    x = Intersections(i,1);
    y = Intersections(i,2);
   text(x, y, sprintf('  p%d(%.6f,%.6f)',i, x, y));
end
title(sprintf('�����ڹ���%d������', size(Intersections,1)));

