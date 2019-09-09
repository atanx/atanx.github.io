function plot_point(obj, event) 
    hold on;
    p = get(gca,'currentPoint');
    p = p(1, 1:2);
    points = [get(gca, 'userData'); p];
    plot(points(:,1), points(:,2), 'ro-');
    set(gca,'userdata', points);
    
end