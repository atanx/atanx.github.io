function pin(x, y, r)
% ���ܣ�������ݡ�
% ���룺
%      x ��ݵ�x����
%      y ��ݵ�y���� 
%      r ��ݵ�ֱ��

    T = linspace(0, 2*pi);
    X = x + r*sin(T);
    Y = y + r*cos(T);
    fill(X, Y, 'b');  % ������
    axis equal;       % �ȱ�������ϵ
end