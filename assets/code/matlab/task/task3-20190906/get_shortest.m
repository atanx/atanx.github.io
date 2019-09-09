function  output = get_shortest(point, curve, t1, t2, err, show_plot)
%% ���������
 % point��       1*2����     ��, [x, y]
 % curve��       �ṹ�����ͣ�  �����귽�����������ߣ����� curve.xfun, curve.yfun �ֱ���t�ĺ���
 % t1��          ������        ������ʼ�Ƕ�
 % t2            ������        ������ֹ�Ƕ�
 % err:          ������        ����/���
 % show_plot:     bool���ͣ�   ����Ƿ���Ҫ��ͼ
 
 % ���������
 % output �ṹ��
 %   output.point        ������
 %   output.curve        ���߷���
 %   output.min_t        �㵽������̾���ʱ��t
 %   output.c_point      ��̾���ʱ�����ϵ�����
 %   output.min_distance ��̾���
 %   output.range_t      ���߽Ƕ�����
%%
    xfun = curve.xfun;
    yfun = curve.yfun;
    myfun = @(t)norm([xfun(t), yfun(t)]-point(1:2));  % ָ����point�����ߵľ��뷽��

    [min_t, min_distance] = fminbnd(myfun, t1, t2, optimset('TolX',err));  % ��Сֵ
    
    output = struct();
    output.point = point;
    output.curve = curve;
    output.min_t =  min_t;
    output.c_point = [xfun(min_t), yfun(min_t)];
    output.min_distance =  min_distance;
    output.range_t = [t1, t2];
    
    if show_plot                               % ���debug����Ϊtrue����ͼ��
        T = linspace(t1,t2, 10000);            
        XC = xfun(T);
        YC = yfun(T);
        plot(XC, YC, 'b');                     % ��������
        hold on 
        %plot(point(1), point(2), 'bo', 'MarkerFaceColor','b');  % ���Ƶ㣬 ��ɫʵ�ĵ�
        pin(point(1), point(2), point(3));
        plot([point(1), xfun(min_t)], [point(2),  yfun(min_t)], 'r-o');  % ��������������ߣ���ɫ����
    end
end