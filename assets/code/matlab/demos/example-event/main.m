% lh = listener(obj,'ToggleState',@RespondToToggle.handleEvnt)

%% tbӵ��ToggledState�¼��� OnStateChange������㲥�¼�
tb = ToggleButton;
%% rtt����tb��ToggledState�¼��������ûص�
rtt = RespondToToggle(tb);
tb.OnStateChange(true)
tb.OnStateChange(false)