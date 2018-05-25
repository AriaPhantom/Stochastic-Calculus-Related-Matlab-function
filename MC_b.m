function [b,Core]=MC_b(n,N,s,K,r,sigma,T)
%n simulation times
%N number of points
%s spot price
%K strike price
%r interest rate
%sigma implied volatility
%T time to maturity

Delta_t=T/N;
S_T=zeros(1,N+1);
Y=zeros(1,n);
X=zeros(1,n);
for i=1:n
    S_T(1)=s;
    for q=1:N
        S_T(q+1)=S_T(q)*exp((r-(sigma^2)/2)*Delta_t+sigma*sqrt(Delta_t)*randn(1));
    end
    Y(i)=exp(-r*T)*max(mean(S_T)-K,0);
    X(i)=exp(-r*T)*max(geomean(S_T)-K,0);
end

b=sum((X-mean(X)).*(Y-mean(Y)))/sum((X-mean(X)).*(X-mean(X)));
Core=b*std(X)/std(Y);
clear n s K r sigma T Sum
