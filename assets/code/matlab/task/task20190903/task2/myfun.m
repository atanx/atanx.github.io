function [deltaY,X,cY, lY] = myfun(uk)
    % deltaY����ֵ
    % cX��
  %{
    xy_2=[0.010596266658714;0.003856725658119];           %ֱ�߶˵�1
xy_22=[0.015509333353215;-0.009641814145298];         %ֱ�߶˵�2  ֱ�߶�x����ȡֵ��Χx=xy_2(1):(xy_22(1)-xy_2(1))/100:xy_22(1)
Zgear1=12;                                            %��֪����
rb1=0.011276311449431;                                %��֪����
uk1_down1=0;                                          %ת�����
uk1_top1=0.820777692661297;                           %ת���յ�   �Ƕ��Ա�����Χuk=uk1_down1:0.002:uk1_top1
A_gear1_L=[cos(-(4-1)*2*pi/Zgear1),-sin(-(4-1)*2*pi/Zgear1);  %����         
           sin(-(4-1)*2*pi/Zgear1),cos(-(4-1)*2*pi/Zgear1)];

%%ֱ�߷��� 
y=(x-xy_2(1))/(xy_22(1)-xy_2(1))*(xy_22(2)-xy_2(2))+xy_2(2);                                         %ͨ���������㷨���ֱ�߷���
%%%������(����)����
x=A_gear1_L(1,1)*(rb1*sin(uk)-rb1*uk*cos(uk))+A_gear1_L(1,2)*(rb1*cos(uk)+rb1*uk*sin(uk));           %������x���귽�̣�ukΪת���Ա���
y=A_gear1_L(2,1)*(rb1*sin(uk)-rb1*uk*cos(uk))+A_gear1_L(2,2)*(rb1*cos(uk)+rb1*uk*sin(uk));           %������y���귽��

    %}
    
    %% ֱ��
    xy_2=[0.010596266658714;0.003856725658119];           %ֱ�߶˵�1
    xy_22=[0.015509333353215;-0.009641814145298];         %ֱ�߶˵�2 
    fline = @(x)(x-xy_2(1))/(xy_22(1)-xy_2(1))*(xy_22(2)-xy_2(2))+xy_2(2); 
    %%  ������
    rb1=0.011276311449431;                   %��֪���� 
    Zgear1=12;                                            %��֪����
    A_gear1_L=[cos(-(4-1)*2*pi/Zgear1),-sin(-(4-1)*2*pi/Zgear1);  %����         
               sin(-(4-1)*2*pi/Zgear1),cos(-(4-1)*2*pi/Zgear1)];

    X=A_gear1_L(1,1)*(rb1*sin(uk)-rb1*uk.*cos(uk))+A_gear1_L(1,2)*(rb1*cos(uk)+rb1*uk.*sin(uk));           %������x���귽�̣�ukΪת���Ա���
    cY=A_gear1_L(2,1)*(rb1*sin(uk)-rb1*uk.*cos(uk))+A_gear1_L(2,2)*(rb1*cos(uk)+rb1*uk.*sin(uk));           %������y���귽��

   % X=rb1 * sin(uk) - rb1 * uk .* cos(uk);           %������x���귽�̣�ukΪת���Ա���
   % cY=rb1 * cos(uk) + rb1 * uk .* sin(uk);           %������y���귽�� 

    lY = fline(X);
    deltaY = cY - lY;

end