close all
clear all
randn('seed',0);
rand('seed',0);
C1=randnorm([3 4],[1 0.8;0.8 1],1000);
C2=randnorm([5 0],[1 0.8;0.8 1],1000);
y=[zeros(1,1000) ones(1,1000)];
C=[C1 C2];
W=pca(C);
x1=W*C;
%figure;plotpat(x1,y);
x2=pinv(W)*x1;
figure;title('PCA');
plotpat(x1,y);

W=fisher(C,y);
x1=W*C;
x2=pinv(W)*x1;
figure;
title('Fisher')
plotpat(x1,y);
