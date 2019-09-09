hf = figure;

hp = plot(1,1);

set(hf,'WindowButtonMotionFcn', @mousemotion); % 添加鼠标移动回调

hmenu = uicontextmenu;
uimenu(hmenu, 'label', '添加点', 'Callback', @plot_point);  % 添加右键菜单
uimenu(hmenu, 'label', '查看');
set(gca, 'uicontextmenu', hmenu);  % 给坐标系添加右键菜单
