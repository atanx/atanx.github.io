hf = figure;

hp = plot(1,1);

set(hf,'WindowButtonMotionFcn', @mousemotion); % �������ƶ��ص�

hmenu = uicontextmenu;
uimenu(hmenu, 'label', '��ӵ�', 'Callback', @plot_point);  % ����Ҽ��˵�
uimenu(hmenu, 'label', '�鿴');
set(gca, 'uicontextmenu', hmenu);  % ������ϵ����Ҽ��˵�
