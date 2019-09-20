function showmap
%界面
fig=figure( 'Name','Timer','Position',[0,0,500,500] ,'NumberTitle','off','visible','off');
movegui(fig,'center');
set(fig,'visible','on');
%几个控件
uicontrol('Style','edit','Position',[150,250,200,30],...
    'String','Enter something here',...
    'KeyPressFcn',@keyPress);
ttext= uicontrol('Style','text','Position',[150,350,100,30],...
    'String','Show something here"');
uicontrol('Style','pushbutton','Position',[50,50,200,30],...
    'String','Pause',...
    'callback',@btnPause);
uicontrol('Style','pushbutton','Position',[250,50,200,30],...
    'String','Go on',...
    'callback',@btnGoOn);

    function keyPress(x,y)
        ii=0;
        while(1) %循环
            set(ttext,'string',num2str(ii));
            ii = ii+1;
            pause(1);
        end
        
    end
%这俩命令
    function btnPause(x,y)
        uiwait();
    end
    function btnGoOn(x,y)
        set(ttext,'string','goon');
        uiresume();
        pause(5);
    end
end