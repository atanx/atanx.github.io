xy_2=[0.010596266658714;0.003856725658119];           %ֱ�߶˵�1
xy_22=[0.015509333353215;-0.009641814145298];         %ֱ�߶˵�2
%%%ֱ�߷��� 
lineX = -0.4:0.001:0.4;
fline = @(x)(x-xy_2(1))/(xy_22(1)-xy_2(1))*(xy_22(2)-xy_2(2))+xy_2(2);
lineY=(lineX-xy_2(1))/(xy_22(1)-xy_2(1))*(xy_22(2)-xy_2(2))+xy_2(2);   %ͨ���������㷨���ֱ�߷���
%%%������(����)����
rb1=0.011276311449431;                   %��֪����

axis equal
n=8*pi;
uk=0:pi/200:n;
X=rb1*sin(uk)-rb1*uk.*cos(uk);           %������x���귽�̣�ukΪת���Ա���
Y=rb1*cos(uk)+rb1*uk.*sin(uk);           %������y���귽��
figure
hold on
lineY = fline(X);
%plot(lineX, lineY, 'r.');
% plot(X, Y, 'g.') 
plot(X, Y-lineY, '.')
axis equal;

 
 