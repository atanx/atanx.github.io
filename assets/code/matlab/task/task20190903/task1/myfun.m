function [deltaY,X,cY, lY] = myfun(uk)
    % deltaY����ֵ
    % cX��
    %% ֱ��
    xy_2=[0.010596266658714;0.003856725658119];           %ֱ�߶˵�1
    xy_22=[0.015509333353215;-0.009641814145298];         %ֱ�߶˵�2 
    fline = @(x)(x-xy_2(1))/(xy_22(1)-xy_2(1))*(xy_22(2)-xy_2(2))+xy_2(2); 
    %%  ������
    rb1=0.011276311449431;                   %��֪����
    X=rb1 * sin(uk) - rb1 * uk .* cos(uk);           %������x���귽�̣�ukΪת���Ա���
    cY=rb1 * cos(uk) + rb1 * uk .* sin(uk);           %������y���귽�� 

    lY = fline(X);
    deltaY = cY - lY;

end