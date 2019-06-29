function punto=procedimiento(A,B,maxi,mini)
Prob=inf;
probGold=length(A)/(length(A)+length(B));
probBass=length(B)/(length(A)+length(B));

for i=mini:1:maxi-1
    colG=length(find(A>i));
    Gold=colG/length(A);    
    colB=length(find(B<=i));
    Bass=colB/length(B);
    aux=probGold*Gold+probBass*Bass;
    if(Prob>aux)
        Prob=aux;
        punto=i;
    end
end
end