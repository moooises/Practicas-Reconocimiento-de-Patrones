clear all
close all

randn('seed',0);
A=round(20+randn(1,500)*5);
B=round(30+randn(1,500)*2);

%% 
figure(1);
histogram(A,min(A(:)):1:max(A(:)));hold on;
histogram(B,min(B(:)):1:max(B(:)));hold off;
[Aa,Ba]=hist(A,min(A(:)):1:max(A(:)));
[Ab,Bb]=hist(B,min(B(:)):1:max(B(:)));


%%
probabilidadA=Aa(:,:)/length(A);
probabilidadB=Ab(:,:)/length(B);

%%
pobBass=5/10;
pobGold=5/10;
j=1;
for i=24:28
   nbass=length(find(A>i));%mayor que 24
   probass=nbass/500;
   ngold=length(find(B<=i));%menor que 24
   probgold=ngold/500;
   error(j)=probass*pobBass+probgold*pobGold;
   j=j+1;
end
error
min(error)



%% Quieres el ERROR
%por eso las condiciones estan invertidas a como te indica el enunciado
randn('seed',0);
A=round(20+randn(1,500)*5);
B=round(30+randn(1,50)*2);
pobBass=50/550;
pobGold=500/550;
j=1;
for i=24:28
   nbass=length(find(A>i));%mayor que 24
   probass=nbass/50;
   ngold=length(find(B<=i));%menor que 24
   probgold=ngold/500;
   error(j)=probass*pobBass+probgold*pobGold;
   j=j+1;
end
min(error)

%%
randn('seed',0);
A=round(20+randn(1,50)*5);
B=round(30+randn(1,500)*2);
pobBass=500/550;
pobGold=50/550;
j=1;
for i=24:28
   nbass=length(find(A>i));%mayor que 24
   probass=nbass/500;
   ngold=length(find(B<=i));%menor que 24
   probgold=ngold/50;
   error(j)=probass*pobBass+probgold*pobGold;
   j=j+1;
end
min(error)

%%
A=round(20+randn(1,500)*5);
B=round(30+randn(1,500)*2);
probBass=500/1000;
probGold=500/1000;

if(min(A(:))<min(B(:)))
    mini=min(A(:));
else
   mini=min(B(:)); 
end

if(max(A(:))>max(B(:)))
    maxi=max(A(:));
else
   maxi=min(B(:)); 
end

puntominimo=procedimiento(A,B,maxi,mini)
col1=length(find(A>puntominimo));
probcol1=col1/length(A);
col2=length(find(A<=puntominimo));
probcol2=col2/length(B);
probBass*probcol2+probGold*probcol1


