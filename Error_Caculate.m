T=1;
K=100;
r=0.01;
sigma=0.2;
for q=1:4
[x,y]=FDM_IM(log(200),T,K,r,sigma,100*4^(q-1),100*2^(q-1));
y_exac=zeros(length(x),1);
for i=1:length(x)
    y_exac(i)=European(x(i),T,K,r,sigma);
end

error_array=abs(y-y_exac);
error=sum(error_array)/length(x);
disp(error);
end