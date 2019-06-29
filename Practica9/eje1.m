clear all
close all
rand('seed',0);
randn('seed',0);


%% validacion simple
x=rand(1,100);
y=exp(x.^3-x.^2+0.01*x+2)+0.04*randn(size(x));



for i=1:100
[x,y]=shuffle(x,y);
TrainX=x(1:70)';% 70%
TrainY=y(1:70)';
TestX=x(71:end)';
TestY=y(71:end)';
% degree 1
A=[TrainX ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX ones(size(TestX))];
r=TestY-A*sol;
ErrorTest1(i)=r'*r;
% degree 2
A=[TrainX.^2 TrainX ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^2 TestX ones(size(TestX))];
r=TestY-A*sol;
ErrorTest2(i)=r'*r;
%degree 3
A=[TrainX.^3 TrainX.^2 TrainX ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^3 TestX.^2 TestX ones(size(TestX))];
r=TestY-A*sol;
ErrorTest3(i)=r'*r;
%con un seno
A=[TrainX.^3 TrainX.^2 TrainX sin(TrainX) ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^3 TestX.^2 TestX sin(TestX) ones(size(TestX))];
r=TestY-A*sol;
ErrorTest4(i)=r'*r;
%con dos senos
A=[TrainX.^3 TrainX.^2 TrainX sin(TrainX) sin(TrainX) ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^3 TestX.^2 TestX sin(TestX) sin(TestX) ones(size(TestX))];
r=TestY-A*sol;
ErrorTest5(i)=r'*r;
end
figure(1);
subplot(2,3,1);plot(ErrorTest1);
subplot(2,3,2);plot(ErrorTest2);
subplot(2,3,3);plot(ErrorTest3);
subplot(2,3,4);plot(ErrorTest4);
subplot(2,3,5);plot(ErrorTest5);

%% Validacion cruzada 

x=rand(1,100);
y=exp(x.^3-x.^2+0.01*x+2)+0.04*randn(size(x));

z1=1;
% con orden 10 
S=10
z=length(x)/S;
for i=1:(z-1)

 z2=z1+S;
[x,y]=shuffle(x,y);
if(z1==1)
    TrainX=x(z2+1:end)';% 70%
    TrainY=y(z2+1:end)';
else
    TrainX=x(1:z1-1);
    TrainX=[TrainX x(z2+1:end)];
    TrainY=y(1:z1-1);
    TrainY=[TrainY y(z2+1:end)];
    TrainX=TrainX';
    TrainY=TrainY';
end
TestX=x(z1:z2)';
TestY=y(z1:z2)';
% degree 1
A=[TrainX ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX ones(size(TestX))];
r=TestY-A*sol;
ErrorTest1(i)=r'*r;
% degree 2
A=[TrainX.^2 TrainX ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^2 TestX ones(size(TestX))];
r=TestY-A*sol;
ErrorTest2(i)=r'*r;
%degree 3
A=[TrainX.^3 TrainX.^2 TrainX ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^3 TestX.^2 TestX ones(size(TestX))];
r=TestY-A*sol;
ErrorTest3(i)=r'*r;
%con un seno
A=[TrainX.^3 TrainX.^2 TrainX sin(TrainX) ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^3 TestX.^2 TestX sin(TestX) ones(size(TestX))];
r=TestY-A*sol;
ErrorTest4(i)=r'*r;
%con dos senos
A=[TrainX.^3 TrainX.^2 TrainX sin(TrainX) sin(TrainX) ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^3 TestX.^2 TestX sin(TestX) sin(TestX) ones(size(TestX))];
r=TestY-A*sol;
ErrorTest5(i)=r'*r;
z1=z1+S;
end
figure(2);
subplot(2,3,1);plot(ErrorTest1);
subplot(2,3,2);plot(ErrorTest2);
subplot(2,3,3);plot(ErrorTest3);
subplot(2,3,4);plot(ErrorTest4);
subplot(2,3,5);plot(ErrorTest5);

%% leave one out
x=rand(1,100);
y=exp(x.^3-x.^2+0.01*x+2)+0.04*randn(size(x));


for i=1:100 
[x,y]=shuffle(x,y);

TrainX=x;
TrainY=y;
TestX=x(i)';
TestY=y(i)';
TrainX(i)=[];
TrainY(i)=[];
TrainX=TrainX';
TrainY=TrainY';

% degree 1
A=[TrainX ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX ones(size(TestX))];
r=TestY-A*sol;
ErrorTest1(i)=r'*r;
% degree 2
A=[TrainX.^2 TrainX ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^2 TestX ones(size(TestX))];
r=TestY-A*sol;
ErrorTest2(i)=r'*r;
%degree 3
A=[TrainX.^3 TrainX.^2 TrainX ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^3 TestX.^2 TestX ones(size(TestX))];
r=TestY-A*sol;
ErrorTest3(i)=r'*r;
%con un seno
A=[TrainX.^3 TrainX.^2 TrainX sin(TrainX) ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^3 TestX.^2 TestX sin(TestX) ones(size(TestX))];
r=TestY-A*sol;
ErrorTest4(i)=r'*r;
%con dos senos
A=[TrainX.^3 TrainX.^2 TrainX sin(TrainX) sin(TrainX) ones(size(TrainX))];
sol=pinv(A)*TrainY;
A=[TestX.^3 TestX.^2 TestX sin(TestX) sin(TestX) ones(size(TestX))];
r=TestY-A*sol;
ErrorTest5(i)=r'*r;
end
figure(3);
subplot(2,3,1);plot(ErrorTest1);
subplot(2,3,2);plot(ErrorTest2);
subplot(2,3,3);plot(ErrorTest3);
subplot(2,3,4);plot(ErrorTest4);
subplot(2,3,5);plot(ErrorTest5);