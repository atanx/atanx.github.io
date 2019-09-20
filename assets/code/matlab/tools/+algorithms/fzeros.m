function Roots = fzeros(func,  x_start, x_end, step, err)
%  func: 函数句柄
%  x_start: 起始点
%  x_end: 终止点
% step：步长， 默认0.01
% err: 精度默认 1e-7
%
        if nargin < 5
            err = 1e-7;
        end
        if nargin < 4
            step = 0.01;
        end
        X = x_start: step: x_end;
        Y = func(X);  % 计算函数
        Y1 = Y(1:end-1);
        Y2 = Y(2:end);
        X1 = X(1:end-1);
        X2 = X(2:end);
        P = Y1.*Y2<0;               %  零点处所在区间两个端点的y值必然符号不同
        Xp = [X1(P)', X2(P)'];  %   计算零点区间
        %% 二分法求解指定精度 Tr
        m= size(Xp, 1);
        Xr = zeros(m, 1);
        for i = 1 : m
        Xr(i) = algorithms.bisection(func, Xp(i,1), Xp(i,2), err); 
        end
        Roots = Xr;
end