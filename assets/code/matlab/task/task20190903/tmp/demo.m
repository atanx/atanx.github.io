
function demo()
n=4*pi;
t=0:pi/20:n;
R=1;
x=R*(cos(t)+t.*sin(t));
y=R*(sin(t)-t.*cos(t));
plot(x,y);
axis square
grid

end