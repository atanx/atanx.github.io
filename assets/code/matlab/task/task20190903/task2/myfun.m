function [deltaY,X,cY, lY] = myfun(uk)
    % deltaY：差值
    % cX：
  %{
    xy_2=[0.010596266658714;0.003856725658119];           %直线端点1
xy_22=[0.015509333353215;-0.009641814145298];         %直线端点2  直线段x坐标取值范围x=xy_2(1):(xy_22(1)-xy_2(1))/100:xy_22(1)
Zgear1=12;                                            %已知参数
rb1=0.011276311449431;                                %已知参数
uk1_down1=0;                                          %转角起点
uk1_top1=0.820777692661297;                           %转角终点   角度自变量范围uk=uk1_down1:0.002:uk1_top1
A_gear1_L=[cos(-(4-1)*2*pi/Zgear1),-sin(-(4-1)*2*pi/Zgear1);  %矩阵         
           sin(-(4-1)*2*pi/Zgear1),cos(-(4-1)*2*pi/Zgear1)];

%%直线方程 
y=(x-xy_2(1))/(xy_22(1)-xy_2(1))*(xy_22(2)-xy_2(2))+xy_2(2);                                         %通过以上两点法获得直线方程
%%%渐开线(曲线)方程
x=A_gear1_L(1,1)*(rb1*sin(uk)-rb1*uk*cos(uk))+A_gear1_L(1,2)*(rb1*cos(uk)+rb1*uk*sin(uk));           %渐开线x坐标方程，uk为转角自变量
y=A_gear1_L(2,1)*(rb1*sin(uk)-rb1*uk*cos(uk))+A_gear1_L(2,2)*(rb1*cos(uk)+rb1*uk*sin(uk));           %渐开线y坐标方程

    %}
    
    %% 直线
    xy_2=[0.010596266658714;0.003856725658119];           %直线端点1
    xy_22=[0.015509333353215;-0.009641814145298];         %直线端点2 
    fline = @(x)(x-xy_2(1))/(xy_22(1)-xy_2(1))*(xy_22(2)-xy_2(2))+xy_2(2); 
    %%  渐开线
    rb1=0.011276311449431;                   %已知参数 
    Zgear1=12;                                            %已知参数
    A_gear1_L=[cos(-(4-1)*2*pi/Zgear1),-sin(-(4-1)*2*pi/Zgear1);  %矩阵         
               sin(-(4-1)*2*pi/Zgear1),cos(-(4-1)*2*pi/Zgear1)];

    X=A_gear1_L(1,1)*(rb1*sin(uk)-rb1*uk.*cos(uk))+A_gear1_L(1,2)*(rb1*cos(uk)+rb1*uk.*sin(uk));           %渐开线x坐标方程，uk为转角自变量
    cY=A_gear1_L(2,1)*(rb1*sin(uk)-rb1*uk.*cos(uk))+A_gear1_L(2,2)*(rb1*cos(uk)+rb1*uk.*sin(uk));           %渐开线y坐标方程

   % X=rb1 * sin(uk) - rb1 * uk .* cos(uk);           %渐开线x坐标方程，uk为转角自变量
   % cY=rb1 * cos(uk) + rb1 * uk .* sin(uk);           %渐开线y坐标方程 

    lY = fline(X);
    deltaY = cY - lY;

end