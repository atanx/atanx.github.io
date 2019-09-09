function circle(R)
alpha=0:pi/50:2*pi;%½Ç¶È[0,2*pi]
%R=2;%°ë¾¶
x=R*cos(alpha);
y=R*sin(alpha);
patch(x,y,'red')
axis equal