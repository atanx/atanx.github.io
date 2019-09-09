%%
t = 0:.01:10;
myfun = @(x)x.^3-2*x.^2-10;
y = myfun(t);
[min_t, min_y] = fminbnd(myfun, 0, 10);
plot(t,y);
hold on 
plot(min_t, min_y, 'or');

%%
curve = struct();
curve.xfun = @sin;
curve.yfun = @(t)(t.*cos(t));
out = get_shortest([5,3], curve, 0, 2*pi, true)
axis equal