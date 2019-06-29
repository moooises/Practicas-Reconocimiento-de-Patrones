rand('seed',0)
x=fix(rand(1,30)*100);
length(find(x<9 & x>0))%[0<9]
length(find(x<19 & x>10))%[10<19]
length(find(x<29 & x>20))%[20<29]
length(find(x<39 & x>30))%[30<39]
length(find(x<49 & x>40))%[40<49]
length(find(x<59 & x>50))%[50<59]
length(find(x<69 & x>60))%[60<69]
length(find(x<79 & x>70))%[70<79]
length(find(x<89 & x>80))%[80<89]
length(find(x<99 & x>90))%[90<99]

hist(x)
[a,b]=hist(x)
a=hist(x,5:10:95);
[a,b]=hist(x,5:10:95);