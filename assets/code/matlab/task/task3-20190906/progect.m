%��������������Ѱ�Ұ����֣����ߣ������������ģ�Բ�ģ�֮�����С�ľ���
tic
%% ��֪����
N_pins=40;                  %���������
rp=0.128/2;                 %��������Բ�뾶
k1=0.85;                    %�̷�ϵ��,��ȡֵԭ��
rrp=0.003;                  %������ݰ뾶�����ڻ����߳�����
zp=N_pins;                  %���ֳ���
ih=zp/(zp-1); 
er=k1*rp/zp;                %������ƫ�ľࡾ���롿
drrp=-0.00000;               %�Ⱦ�����
drp=-0.00000;               %�ƾ�����
dsi=0;                       %ת������
%% ���߷��̣�
rng(1.1); % ��������ӣ�ȷ���������������
ti=0:0.01:2*(zp-1)*pi;                                                     %�Ա����Ƕ�
fi=(1+k1^2-2*k1*cos(ti)).^(-1/2);
x_baixian=(rp+drp-(rrp+drrp).*fi).*cos((1-ih).*ti-dsi)-(er-k1*(rrp+drrp).*fi).*cos(ih.*ti+dsi)+er;   %x���귽��
y_baixian=-((rp+drp-(rrp+drrp).*fi).*sin((1-ih).*ti-dsi)+(er-k1*(rrp+drrp).*fi).*sin(ih.*ti+dsi));   %x���귽��
%% �������λ�õ����������(��֪����)
error_angle_region=[-05/60/60*pi/180,05/60/60*pi/180]';                    %
error_pin_angle=error_angle_region(1)+(error_angle_region(2)-error_angle_region(1)).*rand([1 N_pins]);
error_region=[-0.000002,0.000005]';
error_pin_length=error_region(1)+(error_region(2)-error_region(1)).*rand([1 N_pins]);
error_center=[0.000000,0.000005]';
error_center_location=error_center(1)+(error_center(2)-error_center(1)).*rand([1 1]);
error_center_angle=[0.000000,2*pi]'; 
error_center_location_angle=error_center_angle(1)+(error_center_angle(2)-error_center_angle(1)).*rand([1 1]);
error_rpin_region=[-0.000001,0.000001]';
error_rpin_length=error_rpin_region(1)+(error_rpin_region(2)-error_rpin_region(1)).*rand([1 N_pins]);

%% �ص�ע��1��ʹ�������������¶������
curve = struct();
fun_fi = @(t)(1+k1^2-2*k1*cos(t)).^(-1/2);
curve.xfun = @(t)((rp+drp-(rrp+drrp).*fun_fi(t)).*cos((1-ih).* t -dsi)-(er-k1*(rrp+drrp).*fun_fi(t)).*cos(ih.* t + dsi)+er);
curve.yfun = @(t)(-((rp+drp-(rrp+drrp).*fun_fi(t)).*sin((1-ih).* t -dsi)+(er-k1*(rrp+drrp).*fun_fi(t)).*sin(ih.* t +dsi)));

figure 
hold on
axis equal  % �ȱ���������
plot(x_baixian, y_baixian, 'b');
%% ������ķֲ�
pin_distances_objs = cell(1, N_pins);  % pin_distances_objs�����N_pins����ݾ�����ߵľ�����Ϣ
for i=1:N_pins                                                      
    theta_rp11=(i-1)*360/N_pins*pi/180+error_pin_angle(i);           %�����λ�ֲ�����һ����ˮƽλ�ã���ʱ�����ηֲ�
    x_pin11=(rp+error_pin_length(i))*cos(theta_rp11)+error_center_location*cos(error_center_location_angle);                %�������x���귽��
    y_pin11=(rp+error_pin_length(i))*sin(theta_rp11)+error_center_location*sin(error_center_location_angle);                %�������y���귽��
    
    %% �ص�ע��2������ÿһ����ݾ�����ߵ����·����Ϣ, ����ͼ
    pin_distances_objs{i} = get_shortest([x_pin11, y_pin11, rrp], curve, 0, 2*(zp-1)*pi, 1e-8, false); 
end

distances = cellfun(@(x)x.min_distance, pin_distances_objs);   % ע��3����cell�����������ȡÿһ����ݾ�����ߵ���̾��룬distances��һ��1*N_points�ľ���
[min_distance, idx] = min(distances);                          % ע��4����������о������������룬������±�         
%% ע��5����������о������������룬������±�
for i = 1:N_pins
    obj = pin_distances_objs{i};
   if i == idx
       color = 'r';
        pin_distance_message = sprintf('x=%.7f, y=%.7f, d=%.7f [���]', obj.c_point(1), obj.c_point(2), obj.min_distance);
      
   else
        color = 'k';
        pin_distance_message = sprintf('x=%.7f, y=%.7f, d=%.7f', obj.c_point(1), obj.c_point(2), obj.min_distance);
   end
   disp(pin_distance_message);
   text(obj.c_point(1), obj.c_point(2), pin_distance_message, 'color', color);
end
%%

toc
%��󣬻��Ƴ����������ߺ͸������ͼ������úͱ�ǳ������������Ͼ������������ľ������������ֵ
%Ҫ�����Ч��Խ��Խ�ã�������������1΢�����£�10^-7