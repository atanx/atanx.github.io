%任务描述，快速寻找摆线轮（曲线）与各个针齿中心（圆心）之间的最小的距离
tic
%% 已知参数
N_pins=40;                  %针齿数变量
rp=0.128/2;                 %针轮中心圆半径
k1=0.85;                    %短幅系数,查取值原则
rrp=0.003;                  %理论针齿半径（用于画摆线齿廓）
zp=N_pins;                  %针轮齿数
ih=zp/(zp-1); 
er=k1*rp/zp;                %曲柄轴偏心距【理想】
drrp=-0.00000;              %等距修形
drp=-0.00000;               %移距修形
dsi=0;                      %转角修形
Rrp=[];pins_center11=[];
%% 决定针齿位置的随机误差参数(已知参数)
% error_angle_region=[-05/60/60*pi/180,05/60/60*pi/180]';                    %
% error_region=[-0.000002,0.000005]';
% error_center=[0.000000,0.000005]';
% error_center_angle=[0.000000,2*pi]'; 
% error_rpin_region=[-0.000001,0.000001]';
error_angle_region=[0,0]';                    %
error_region=[0,0]';
error_center=[0,0]';
error_center_angle=[0,0]'; 
error_rpin_region=[0,0]';
error_pin_angle=error_angle_region(1)+(error_angle_region(2)-error_angle_region(1)).*rand([1 N_pins]);
error_pin_length=error_region(1)+(error_region(2)-error_region(1)).*rand([1 N_pins]);
error_center_location=error_center(1)+(error_center(2)-error_center(1)).*rand([1 1]);
error_center_location_angle=error_center_angle(1)+(error_center_angle(2)-error_center_angle(1)).*rand([1 1]);
error_rpin_length=error_rpin_region(1)+(error_rpin_region(2)-error_rpin_region(1)).*rand([1 N_pins]);
for angle_crank=0:7.2*pi/180:20*pi/180;
angle_cycloid=-angle_crank/(N_pins-1);
A_cycloid=[cos(angle_cycloid),-sin(angle_cycloid);sin(angle_cycloid),cos(angle_cycloid)];               %摆线轮转换矩阵
%% 摆线方程：
rng(1.1);                   %随机数种子，确保后续随机数复现
ti=0:0.001:2*(zp-1)*pi;                                                     %离散点只是用于绘制摆线轮，与计算找出接触点的精度无关
fi=(1+k1^2-2*k1*cos(ti)).^(-1/2);
% x_baixian=(rp+drp-(rrp+drrp).*fi).*cos((1-ih).*ti-dsi)-(er-k1*(rrp+drrp).*fi).*cos(ih.*ti+dsi)+er;   %x坐标方程
% y_baixian=-((rp+drp-(rrp+drrp).*fi).*sin((1-ih).*ti-dsi)+(er-k1*(rrp+drrp).*fi).*sin(ih.*ti+dsi));   %x坐标方程
x_baixian=(A_cycloid(1,1)*((rp+drp-(rrp+drrp).*fi).*cos((1-ih).*ti-dsi)-(er-k1*(rrp+drrp).*fi).*cos(ih.*ti+dsi))+A_cycloid(1,2)*(-((rp+drp-(rrp+drrp).*fi).*sin((1-ih).*ti-dsi)+(er-k1*(rrp+drrp).*fi).*sin(ih.*ti+dsi))))+er*cos(angle_crank);   %x坐标方程
y_baixian=(A_cycloid(2,1)*((rp+drp-(rrp+drrp).*fi).*cos((1-ih).*ti-dsi)-(er-k1*(rrp+drrp).*fi).*cos(ih.*ti+dsi))+A_cycloid(2,2)*(-((rp+drp-(rrp+drrp).*fi).*sin((1-ih).*ti-dsi)+(er-k1*(rrp+drrp).*fi).*sin(ih.*ti+dsi))))+er*sin(angle_crank);   %x坐标方程
%% 重点注释1：使用内联函数重新定义摆线
curve = struct();
fun_fi = @(t)(1+k1^2-2*k1*cos(t)).^(-1/2);
% curve.xfun = @(t)((rp+drp-(rrp+drrp).*fun_fi(t)).*cos((1-ih).* t -dsi)-(er-k1*(rrp+drrp).*fun_fi(t)).*cos(ih.* t + dsi)+er);
% curve.yfun = @(t)(-((rp+drp-(rrp+drrp).*fun_fi(t)).*sin((1-ih).* t -dsi)+(er-k1*(rrp+drrp).*fun_fi(t)).*sin(ih.* t +dsi)));
curve.xfun = @(t)((A_cycloid(1,1)*((rp+drp-(rrp+drrp).*fun_fi(t)).*cos((1-ih).* t-dsi)-(er-k1*(rrp+drrp).*fun_fi(t)).*cos(ih.* t + dsi))+A_cycloid(1,2)*(-((rp+drp-(rrp+drrp).*fun_fi(t)).*sin((1-ih).* t -dsi)+(er-k1*(rrp+drrp).*fun_fi(t)).*sin(ih.* t+dsi))))+er*cos(angle_crank));
curve.yfun = @(t)((A_cycloid(2,1)*((rp+drp-(rrp+drrp).*fun_fi(t)).*cos((1-ih).* t-dsi)-(er-k1*(rrp+drrp).*fun_fi(t)).*cos(ih.* t + dsi))+A_cycloid(2,2)*(-((rp+drp-(rrp+drrp).*fun_fi(t)).*sin((1-ih).* t -dsi)+(er-k1*(rrp+drrp).*fun_fi(t)).*sin(ih.* t+dsi))))+er*sin(angle_crank));
fig=figure('Position',[20,50,1800,1200]);
set(gcf,'renderer','painters');
hold on
axis equal                                                                 %等比例坐标轴
plot(x_baixian, y_baixian, 'b');
%% 针齿中心分布
pin_distances_objs = cell(1, N_pins);                                      %pin_distances_objs存放了N_pins个针齿距离摆线的距离信息
for i=1:N_pins                                                      
    theta_rp11=(i-1)*360/N_pins*pi/180+error_pin_angle(i);                 %针齿相位分布，第一个在水平位置，逆时针依次分布
    x_pin11=(rp+error_pin_length(i))*cos(theta_rp11)+error_center_location*cos(error_center_location_angle);                %针齿中心x坐标方程
    y_pin11=(rp+error_pin_length(i))*sin(theta_rp11)+error_center_location*sin(error_center_location_angle);                %针齿中心y坐标方程
    pin_center11=[x_pin11;y_pin11];
    pins_center11=[pins_center11,pin_center11];                      %累积各个针齿中心位置
    rrp1=rrp+error_rpin_length(i);
    Rrp=[Rrp,rrp1];    
    %% 重点注释2：计算每一个针齿距离摆线的最短路径信息, 并绘图
    pin_distances_objs{i} = get_shortest([x_pin11, y_pin11, rrp], curve, 0, 2*(zp-1)*pi, 1e-8, true); 
end
distances = cellfun(@(x)x.min_distance, pin_distances_objs);   % 注释3：从cell数组对象中提取每一个针齿距离摆线的最短距离，distances是一个1*N_points的矩阵
[min_distance, idx] = min(distances);                          % 注释4：所有针齿中距离摆线最近距离，及针齿下标         
%% 注释5：所有针齿中距离摆线最近距离，及针齿下标
for i = 1:N_pins
    obj = pin_distances_objs{i};
%    if i == idx
%        color = 'r';
%         pin_distance_message = sprintf('x=%.7f, y=%.7f, d=%.7f [最短]', obj.c_point(1), obj.c_point(2), obj.min_distance);
%       
%    else
%         color = 'k';
%         pin_distance_message = sprintf('x=%.7f, y=%.7f, d=%.7f', obj.c_point(1), obj.c_point(2), obj.min_distance);
%    end
%    disp(pin_distance_message);
%    text(obj.c_point(1), obj.c_point(2), pin_distance_message, 'color', color);
   plot(obj.c_point(1),obj.c_point(2),'*k')
   hold on
end
%{
for i=1:N_pins
    theta_pin=0:0.01:(2*pi+2*pi/63);
    xx_pin11=Rrp(i)*cos(theta_pin)+pins_center11(1,i);                     %【非理想】
    yy_pin11=Rrp(i)*sin(theta_pin)+pins_center11(2,i);
    plot(xx_pin11,yy_pin11,'-k','LineWidth',1)                             %以针齿中心为圆，以针齿半径为半径画针齿圆【非理想】
    hold on
end
%}
end
%%
toc
%最后，绘制出摆线轮曲线和各个针齿图，并获得和标记出摆线轮曲线上距离各个针齿中心距离最近的坐标值
%要求计算效率越高越好，精度误差控制在1微米以下，10^-7