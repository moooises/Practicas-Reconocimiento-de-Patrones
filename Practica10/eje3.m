close all
clear all
randn('seed',0);
rand('seed',0);

load DNATRN;
W=pca(x,y);
x1=W*x;
[F]=fisher(x,y);
x2=F*x;
figure;
plotpat(x1,y);
figure;
plotpat(x2,y);
%fisher is better

%%
clear all
close all
load DIABETES
train=round((length(x)/3)*2);
W=pca(x(:,1:train),2);%% cuando dice 8-2 se refiere a esto
Trainx=x(:,1:train);
Trainx=W*Trainx;
Trainx=Trainx';
Trainy=y(:,1:train)';
A=[Trainx ones(size(Trainx))];
sol=pinv(A)*Trainy;
Testx=x(:,train+1:end);
Testx=W*Testx;
Testx=Testx';
Testy=y(:,train+1:end)';
A=[Testx ones(size(Testx))];
r=Testy-A*sol;
ErrorPCA=r'*r;

W=fisher(x(:,1:train),y(:,1:train),2);%% cuando dice 8-2 se refiere a esto
Trainx=x(:,1:train);
Trainx=W*Trainx;
Trainx=Trainx';
Trainy=y(:,1:train)';
A=[Trainx ones(size(Trainx))];
sol=pinv(A)*Trainy;
Testx=x(:,train+1:end);
Testx=W*Testx;
Testx=Testx';
Testy=y(:,train+1:end)';
A=[Testx ones(size(Testx))];
r=Testy-A*sol;
ErrorFisher=r'*r;

ErrorPCA
ErrorFisher