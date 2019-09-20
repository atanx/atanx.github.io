% lh = listener(obj,'ToggleState',@RespondToToggle.handleEvnt)

%% tb拥有ToggledState事件， OnStateChange方法会广播事件
tb = ToggleButton;
%% rtt监听tb的ToggledState事件，并设置回调
rtt = RespondToToggle(tb);
tb.OnStateChange(true)
tb.OnStateChange(false)