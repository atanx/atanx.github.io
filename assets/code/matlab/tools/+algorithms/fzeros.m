function Roots = fzeros(func,  x_start, x_end, step, err)
%  func: �������
%  x_start: ��ʼ��
%  x_end: ��ֹ��
% step�������� Ĭ��0.01
% err: ����Ĭ�� 1e-7
%
        if nargin < 5
            err = 1e-7;
        end
        if nargin < 4
            step = 0.01;
        end
        X = x_start: step: x_end;
        Y = func(X);  % ���㺯��
        Y1 = Y(1:end-1);
        Y2 = Y(2:end);
        X1 = X(1:end-1);
        X2 = X(2:end);
        P = Y1.*Y2<0;               %  ��㴦�������������˵��yֵ��Ȼ���Ų�ͬ
        Xp = [X1(P)', X2(P)'];  %   �����������
        %% ���ַ����ָ������ Tr
        m= size(Xp, 1);
        Xr = zeros(m, 1);
        for i = 1 : m
        Xr(i) = algorithms.bisection(func, Xp(i,1), Xp(i,2), err); 
        end
        Roots = Xr;
end