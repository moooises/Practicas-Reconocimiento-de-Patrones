
rand('seed',0);
randn('seed',0);

%% 2 categorias

clear all
close all
load iris.mat
distr=nchoosek(1:4,2);
pos=0;

for i=1:nchoosek(4,2)
    m=[x(distr(i,1),:);x(distr(i,2),:)];
    figure(2);%plot(6,2,pos+1);
    plotpat(m(:,1:150),y);
    for k=1:15
        [~,setosa]=find(y==0);
        maux1=m(:,setosa);
        [~,versicolor]=find(y==1);
        maux2=m(:,versicolor);
        [~,virginica]=find(y==2);
        maux3=m(:,virginica);
        
        centroideSet=kmeans(maux1,k);
        centroideVer=kmeans(maux2,k);
        centroideVir=kmeans(maux3,k);
        
        covarSet=covpat(maux1);
        covarVer=covpat(maux2);
        covarVir=covpat(maux3);
        
        for z=i:k
            for aux=1:150
               d_Set(z,aux)=d_mahal(m(:,aux),centroideSet(:,z),covarSet);
               d_Ver(z,aux)=d_mahal(m(:,aux),centroideVer(:,z),covarVer);
               d_Vir(z,aux)=d_mahal(m(:,aux),centroideVir(:,z),covarVir);
            end
        end
        [d_Set,~]=min(d_Set,[],1);
        [d_Ver,~]=min(d_Ver,[],1);
        [d_Vir,~]=min(d_Vir,[],1);
        d_total=[d_Set;d_Ver;d_Vir];
        
        
        [~,F_fill2]=min(d_total,[],1);
        F_fill2(1,:)=F_fill2(1,:)-1;
        ErrorTest2=[y;F_fill2];
        ErrorCont2=ErrorTest2(1,:)~=ErrorTest2(2,:);
        ErrorCont2=sum(ErrorCont2);
        TasaError2(k)=100*(ErrorCont2/length(y));
        
        end
        figure(3);plot(1:15,TasaError2(1:15),'r');
        pos=pos+2;
    end
        
%% 3 categorias    
    distr=nchoosek(1:4,3);
    pos=0;
    for i=1:nchoosek(4,3)
    m=[x(distr(i,1),:);x(distr(i,2),:);x(distr(i,3),:)];
    figure(2);%plot(6,2,pos+1);
    plotpat(m(:,1:150),y);
    for k=1:15
        [~,setosa]=find(y==0);
        maux1=m(:,setosa);
        [~,versicolor]=find(y==1);
        maux2=m(:,versicolor);
        [~,virginica]=find(y==2);
        maux3=m(:,virginica);
        
        centroideSet=kmeans(maux1,k);
        centroideVer=kmeans(maux2,k);
        centroideVir=kmeans(maux3,k);
        
        covarSet=covpat(maux1);
        covarVer=covpat(maux2);
        covarVir=covpat(maux3);
        
        for z=i:k
            for aux=1:150
               d_Set(z,aux)=d_mahal(m(:,aux),centroideSet(:,z),covarSet);
               d_Ver(z,aux)=d_mahal(m(:,aux),centroideVer(:,z),covarVer);
               d_Vir(z,aux)=d_mahal(m(:,aux),centroideVir(:,z),covarVir);
            end
        end
        [d_Set,~]=min(d_Set,[],1);
        [d_Ver,~]=min(d_Ver,[],1);
        [d_Vir,~]=min(d_Vir,[],1);
        d_total=[d_Set;d_Ver;d_Vir];
        
        [~,F_fill3]=min(d_total,[],1);
        F_fill3(1,:)=F_fill3(1,:)-1;
        ErrorTest3=[y;F_fill3];
        ErrorCont3=ErrorTest3(1,:)~=ErrorTest3(2,:);
        ErrorCont3=sum(ErrorCont3);
        TasaError3(k)=100*(ErrorCont3/length(y));
        
        end
        figure(5);plot(1:15,TasaError3(1:15),'r');
        pos=pos+2;
    end
    
 %% Todas las categorias
 
    m=x;
    figure(7);plotpat(m(:,1:150),y);
    for k=1:15
        [~,setosa]=find(y==0);
        maux1=m(:,setosa);
        [~,versicolor]=find(y==1);
        maux2=m(:,versicolor);
        [~,virginica]=find(y==2);
        maux3=m(:,virginica);
        
        centroideSet=kmeans(maux1,k);
        centroideVer=kmeans(maux2,k);
        centroideVir=kmeans(maux3,k);
        
        covarSet=covpat(maux1);
        covarVer=covpat(maux2);
        covarVir=covpat(maux3);
        
        for z=i:k
            for aux=1:150
               d_Set(z,aux)=d_mahal(m(:,aux),centroideSet(:,z),covarSet);
               d_Ver(z,aux)=d_mahal(m(:,aux),centroideVer(:,z),covarVer);
               d_Vir(z,aux)=d_mahal(m(:,aux),centroideVir(:,z),covarVir);
            end
        end
        [d_Set,~]=min(d_Set,[],1);
        [d_Ver,~]=min(d_Ver,[],1);
        [d_Vir,~]=min(d_Vir,[],1);
        d_total=[d_Set;d_Ver;d_Vir];
        
        [~,F_fill4]=min(d_total,[],1);
        F_fill4(1,:)=F_fill4(1,:)-1;
        ErrorTest4=[y;F_fill4];
        ErrorCont4=ErrorTest4(1,:)~=ErrorTest4(2,:);
        ErrorCont4=sum(ErrorCont4);
        TasaError4(k)=100*(ErrorCont4/length(y));
        
    end 
        
    figure(6);plot(1:15,TasaError4(1:15),'r');



