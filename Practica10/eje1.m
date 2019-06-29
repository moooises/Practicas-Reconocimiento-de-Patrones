close all
clear all
randn('seed',0);
x=randnorm([3 4],[1 0.8;0.8 1],1000);
y=zeros(1,1000);
mean=meanpat(x');
pos=find(mean<1);%% datos aislados
x(:,pos)=[];
y(:,pos)=[];
%figure;plotpat(x)
W=pca(x);
x1=W*x;
%figure;plotpat(x1)
x2=pinv(W)*x1;
%figure;plotpat(x2);
plotpat(x,y,'.');axis equal,hold on;
plotpat(x1,y);
plotpat(x2,y);hold off;
[error1,number]=sumsqr(x1(1,:))
[error2,number]=sumsqr(x2(1,:))