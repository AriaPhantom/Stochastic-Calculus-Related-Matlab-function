function [Price,Error]=MC_Asian_Ordinary_with_Error(n,N,s,K,r,sigma,T)
%n simulation times
%N number of points
%s spot price
%K strike price
%r interest rate
%sigma implied volatility
%T time to maturity
%B the barrier 


Price_Vector=zeros(1,n);

Delta_t=T/N;
S_T=zeros(1,N+1);
for i=1:n
    S_T(1)=s;
    L_Sum=0;
    for q=1:N
        S_T(q+1)=S_T(q)*(1+r*Delta_t+sigma*sqrt(Delta_t)*randn(1));
        L_Sum=L_Sum+S_T(q+1);
    end
    L_Sum=L_Sum/N;
     Price_Vector(i)=exp(-r*T)*max(L_Sum-K,0);
end
Price=mean(Price_Vector);
Error=std(Price_Vector)/sqrt(n);

clear n s K r sigma T B Sum