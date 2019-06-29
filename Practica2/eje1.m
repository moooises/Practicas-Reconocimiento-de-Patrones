x=[90 86 67 89 81 75];
y=[62 45 40 55 64 53];

%a)
figure;plot(x,y);
%No, no parece que haya relacion lineal

%% b)
close all;
x=[90 86 67 89 81 75];
y=[62 45 40 55 64 53];
x=x';
y=y';
Sxx=sum(x.^2);
Sx=sum(x);
Sxy=sum(x.*y);
Sy=sum(y);
A=[Sxx Sx; Sx length(x)];
B=[Sxy;Sy];
sol=A\B
 plot(x,y,'o');hold on;
axis([0 100 0 100]);
xr=[0 100];
yr=[sol(2) sol(1)*100+sol(2)];%sol(1) es a y sol(2) b
%sol(2) cuando x=0 y la siguiente cuando x=10
plot(xr,yr);hold off;
E=sum((y-(sol(1)*x+sol(2))).^2)

%% c)
x=[90 86 89 81 75];
y=[62 45 55 64 53];

x=x';
y=y';
Sxx=sum(x.^2);
Sx=sum(x);
Sxy=sum(x.*y);
Sy=sum(y);

A=[Sxx Sx; Sx length(x)];
B=[Sxy;Sy];
sol=A\B
plot(x,y,'o');hold on;
axis([0 100 0 100]);
xr=[0 100];
yr=[sol(2) sol(1)*100+sol(2)];
plot(xr,xr);hold off;
E=sum((y-(sol(1)*x+sol(2))).^2)
%El error disminuye un poco

%% d)
x=[90 86 67 89 81 75];
y=[62 45 40 55 64 53];

w=sol(1)+88*sol(2)

%% e) Paso

%% f)
x=[90 86 67 89 81 75];
y=[62 45 40 55 64 53];
x=x';
y=y';
A=[x.^2 x ones(size(x))];
sol=inv(A'*A)*A'*y % pinv(A)*y
r=y-A*sol;
E=r'*r

%% g
x=[90 86 67 89 81 75];
y=[62 45 40 55 64 53];

x=x';
y=y';
A=[x.^3 x.^2 x ones(size(x))];
sol=pinv(A)*y
r=y-A*sol;
E=r'*r

%% h
close all
x=[90 86 67 89 81 75];
y=[62 45 40 55 64 53];

x=x';
y=y';

y=1./(y.*y);
yp=log(y);

A=[x ones(size(x))];
sol=pinv(A)*yp;
B=sol(1);C=sol(2);
A=exp(C);
plot(x,y,'o');hold on;
x=linspace(min(x),max(x));
plot(x,A*exp(-B*x),'r');hold off;

%% i)

x=[90 86 67 89 81 75];

x=x';

x2=x/100;
y2=3*x2.*exp(2*x2);
yp=log(y2./x2);%% IMPortante
A=[x2 ones(size(x2))];
sol=pinv(A)*yp;%importante
A=sol(1)
B=sol(2);
C=exp(B)
plot(x2,y2,'o');hold on;
x=0:0.01:1;
plot(x,C*x.*exp(A*x));hold off;


%% 