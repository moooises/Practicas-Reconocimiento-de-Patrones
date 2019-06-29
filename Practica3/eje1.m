[valx,Valy]=meshgrid(-3:0.1:3,-4:0.1:4);
syms x;syms y;
E=(sin(0.5.*x.^2-0.25.*y.^2+3)*cos(2.*x+1+exp(y)));
z =(sin(0.5.*valx.^2-0.25.*valy.^2+3).*cos(2.*valx+1+exp(valy)));
close all
pcolor(x,y,z),shading flat;hold on;
sol = ginput(1)';
for i=1:100,
x=sol(1,i);
y=sol(2,i);
dx=x*cos(x^2/2 - y^2/4 + 3)*cos(2*x + exp(y) + 1) - 2*sin(x^2/2 - y^2/4 + 3)*sin(2*x + exp(y) + 1);
dy=(- sin(x^2/2 - y^2/4 + 3)*exp(y)*sin(2*x + exp(y) + 1) - (y*cos(x^2/2 - y^2/4 + 3)*cos(2*x + exp(y) + 1))/2);

sol(:,i+1) = sol(:,i) - 0.1 * [dx;dy];
plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
pause
end;
