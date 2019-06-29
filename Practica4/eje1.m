%% a) Euclid

clear all
close all
rand('seed',0);
randn('seed',0);
x=randnorm([0 0],[1 0.8;0.8 2],1000);% da dos filas ¡¡¡¡¡
y=randnorm([3 3],[1 -0.9; -0.9 2],1000);
xt=zeros(1,1000);
yt=ones(1,1000);
S=[x y];
St=[xt yt];
[S St]=shuffle(S,St);
plotpat(S(:,1:1600),St(1:1600));hold on;

[~,col0]=find(St(1:1600)==0);
[~,col1]=find(St(1:1600)==1);
X=S(:,col0);
Y=S(:,col1);

M1=meanpat(X);
M2=meanpat(Y);

d1=d_euclid(S(:,1601:end),M1);
d2=d_euclid(S(:,1601:end),M2);

D_euT=[d1;d2];
[~,fill]=min(D_euT);%%te dice si el minimo de cada columna esta en la 1º o 2º fila
fill(1,:)=fill(1,:)-1;%fila una o dos queremos que sea 0 o 1
ErrorTest=[St(1601:end);fill];

ErrorCount=(ErrorTest(1,:)~=ErrorTest(2,:));
ErrorCount=sum(ErrorCount);
Error=(ErrorCount/(length(S)-1600))*100 %400=2000-1600

%% b) Mahala
dm1=d_mahal(S(:,1601:end),M1,[1 0.8;0.8 2]);
dm2=d_mahal(S(:,1601:end),M2,[1 -0.9; -0.9 2]);

D_mahT=[dm1;dm2];
[~,fill]=min(D_mahT);
fill=fill-1;
ErrorTest=[St(1601:end);fill];
ErrorCount=ErrorTest(1,:)~=ErrorTest(2,:);
ErrorCount=sum(ErrorCount);
Error=(ErrorCount/(length(S)-1600))*100

%% c)
axis([-6 8 -6 8]);

plotbon([0 0]',[1 0.8;0.8 2],[3 3]',[1 -0.9; -0.9 2],'b');hold off