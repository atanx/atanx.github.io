function mousemotion(obj, eventdata)
   % disp(obj);
    %figurePosition = obj.Position;
    p = get(gca, 'currentpoint');
    cpoint = p(1,1:2);
    points = get(gca,'UserData');
    if isempty(points)
        
        return
        
    end
    %% 寻找最近的点
    distances = (points(:,1)-cpoint(1)).^2 + (points(:,2)-cpoint(2)).^2;
    [dsquare, idx] = min(distances);
    nearest = points(idx, :);
    
    %% 高亮最近的点
    info = sprintf('x=%.4f,y=%.4f', nearest(1), nearest(2));
    h = findobj(obj, 'tag', 'highlight');
    htext = findobj(obj,'tag','highlighttext');
    if isempty(h)
        plot(nearest(1), nearest(2), 'ro', 'MarkerFaceColor', 'b', 'tag', 'highlight');
    else
        h.XData = nearest(1);
        h.YData = nearest(2);
    end
    
    %% 增加最近点的提示信息
    if isempty(htext) 
        text(nearest(1), nearest(2), info, 'tag', 'highlighttext');
    else
        htext.Position = nearest;
        htext.String = info;
    end 
    
end