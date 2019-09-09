function  output = get_shortest(point, curve, t1, t2, err, show_plot)
%% 输入参数：
 % point：       1*2矩阵，     点, [x, y]
 % curve：       结构体类型，  极坐标方程描述的曲线，曲线 curve.xfun, curve.yfun 分别是t的函数
 % t1：          标量，        曲线起始角度
 % t2            标量，        曲线终止角度
 % err:          标量，        精度/误差
 % show_plot:     bool类型，   标记是否需要绘图
 
 % 输出参数：
 % output 结构体
 %   output.point        点坐标
 %   output.curve        曲线方程
 %   output.min_t        点到曲线最短距离时的t
 %   output.c_point      最短距离时曲线上的坐标
 %   output.min_distance 最短距离
 %   output.range_t      曲线角度区间
%%
    xfun = curve.xfun;
    yfun = curve.yfun;
    myfun = @(t)norm([xfun(t), yfun(t)]-point(1:2));  % 指定点point与曲线的距离方程

    [min_t, min_distance] = fminbnd(myfun, t1, t2, optimset('TolX',err));  % 求极小值
    
    output = struct();
    output.point = point;
    output.curve = curve;
    output.min_t =  min_t;
    output.c_point = [xfun(min_t), yfun(min_t)];
    output.min_distance =  min_distance;
    output.range_t = [t1, t2];
    
    if show_plot                               % 如果debug变量为true，绘图。
        T = linspace(t1,t2, 10000);            
        XC = xfun(T);
        YC = yfun(T);
        plot(XC, YC, 'b');                     % 绘制曲线
        hold on 
        %plot(point(1), point(2), 'bo', 'MarkerFaceColor','b');  % 绘制点， 蓝色实心点
        pin(point(1), point(2), point(3));
        plot([point(1), xfun(min_t)], [point(2),  yfun(min_t)], 'r-o');  % 绘制最近距离连线，红色连线
    end
end