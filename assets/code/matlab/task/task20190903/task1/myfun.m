function [deltaY,X,cY, lY] = myfun(uk)
    % deltaY：差值
    % cX：
    %% 直线
    xy_2=[0.010596266658714;0.003856725658119];           %直线端点1
    xy_22=[0.015509333353215;-0.009641814145298];         %直线端点2 
    fline = @(x)(x-xy_2(1))/(xy_22(1)-xy_2(1))*(xy_22(2)-xy_2(2))+xy_2(2); 
    %%  渐开线
    rb1=0.011276311449431;                   %已知参数
    X=rb1 * sin(uk) - rb1 * uk .* cos(uk);           %渐开线x坐标方程，uk为转角自变量
    cY=rb1 * cos(uk) + rb1 * uk .* sin(uk);           %渐开线y坐标方程 

    lY = fline(X);
    deltaY = cY - lY;

end