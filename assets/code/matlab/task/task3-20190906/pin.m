function pin(x, y, r)
% 功能：绘制针齿。
% 输入：
%      x 针齿的x坐标
%      y 针齿的y坐标 
%      r 针齿的直径

    T = linspace(0, 2*pi);
    X = x + r*sin(T);
    Y = y + r*cos(T);
    fill(X, Y, 'b');  % 填充绘制
    axis equal;       % 等比例坐标系
end