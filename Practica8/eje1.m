clear all
close all
randn('seed',0)
w1=round(20+randn(1,2500)*3);
w2=round(25+randn(1,2500)*2);
Pw1=0.5;
Pw2=0.5;

%% c)
M1=mean(w1);
M2=mean(w2);
D1=std(w1);
D2=std(w2);

A=D1^2-D2^2;
B=2*(M1*D2^2-M2*D1^2);
C=(log(Pw1)-log(D1)-log(Pw2)+log(D2))*2*D1^2*D2^2+(D1^2*M2^2-D2^2*M1^2);
X(1)=(-B+sqrt(B^2-4*A*C))/(2*A);
X(2)=(-B-sqrt(B^2-4*A*C))/(2*A);
disp('Decision boundaries');
X

%% d)

w1=round(20+randn(1,3500)*3);
w2=round(25+randn(1,1500)*2);
Pw1=0.7;
Pw2=0.3;
M1=mean(w1);
M2=mean(w2);
D1=std(w1);
D2=std(w2);
A=D1^2-D2^2;
B=2*(M1*D2^2-M2*D1^2);
C=(log(Pw1)-log(D1)-log(Pw2)+log(D2))*2*D1^2*D2^2+(D1^2*M2^2-D2^2*M1^2);
Y(1)=(-B+sqrt(B^2-4*A*C))/(2*A);
Y(2)=(-B-sqrt(B^2-4*A*C))/(2*A);
disp('Frontera');
Y

%% e)

w1=round(20+randn(1,1500)*3);
w2=round(25+randn(1,3500)*2);
Pw1=0.3;
Pw2=0.7;
M1=mean(w1);
M2=mean(w2);
D1=std(w1);
D2=std(w2);
A=D1^2-D2^2;
B=2*(M1*D2^2-M2*D1^2);
C=(log(Pw1)-log(D1)-log(Pw2)+log(D2))*2*D1^2*D2^2+(D1^2*M2^2-D2^2*M1^2);
Z(1)=(-B+sqrt(B^2-4*A*C))/(2*A);
Z(2)=(-B-sqrt(B^2-4*A*C))/(2*A);
disp('Frontera');
Z