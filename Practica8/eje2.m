clear all
close all
randn('seed',0);

w1=round(20+randn(1,2500)*3);
w2=round(25+randn(1,2500)*2);
m1=mean(w1);
m2=mean(w2);
s1=std(w1);
s2=std(w2);
Pw1=0.5;
Pw2=0.5;
L=[0 1;1 0]

Pxw1=(1/sqrt(2*pi*(s1^2)))*exp(((21.569209544004202-m1)^2)/2*(s1^2))
Pxw2=(1/sqrt(2*pi*s2^2))*exp(((21.569209544004202-m2)^2)/2*s2^2);
r1=(L(1,1)*Pxw1*Pw1)+(L(1,2)*Pxw1*Pw1)
r2=(L(2,1)*Pxw2*Pw2)+(L(2,2)*Pxw2*Pw2)

A=s1*s1-s2*s2;
B=2*(m1*s2*s2-m2*s1*s1);
C=2*s1 * s1 * s2 * s2 * (log(r1)+log(Pw1) - log(r2)+log(Pw2) - log(s1) + log(s2)) + s1*s1*m2*m2-s2 * s2 * m1*m1;
x1=(-B+sqrt(B*B-4*A*C))/2/A
x2=(-B-sqrt(B*B-4*A*C))/2/A

%% 
L=[0 0.8;2 0];

Pxw1=(1/sqrt(2*pi*(s1^2)))*exp(((21.569209544004202-m1)^2)/2*(s1^2))
Pxw2=(1/sqrt(2*pi*s2^2))*exp(((21.569209544004202-m2)^2)/2*s2^2);
r1=(L(1,1)*Pxw1*Pw1)+(L(1,2)*Pxw1*Pw1)
r2=(L(2,1)*Pxw2*Pw2)+(L(2,2)*Pxw2*Pw2)

A=s1*s1-s2*s2;
B=2*(m1*s2*s2-m2*s1*s1);
C=2*s1 * s1 * s2 * s2 * (log(r1)+log(Pw1) - log(r2)+log(Pw2) - log(s1) + log(s2)) + s1*s1*m2*m2-s2 * s2 * m1*m1;
x1=(-B+sqrt(B*B-4*A*C))/2/A
x2=(-B-sqrt(B*B-4*A*C))/2/A



