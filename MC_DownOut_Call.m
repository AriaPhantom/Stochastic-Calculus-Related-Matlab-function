function Price=MC_DownOut_Call(n,N,s,K,r,sigma,T,B)
%n simulation times
%N number of points
%s spot price
%K strike price
%r interest rate
%sigma implied volatility
%T time to maturity
%B the barrier 

if s<B
    Price=0;
else
    Sum=0;
    Delta_t=T/N;
    S_T=zeros(1,N+1);
    for i=1:n
        S_T(1)=s;
        for q=1:N
            S_T(q+1)=S_T(q)*(1+r*Delta_t+sigma*sqrt(Delta_t)*randn(1));
        end
        if min(S_T)>=B
            Sum=Sum+exp(-r*T)*max(S_T(N+1)-K,0);
        end
    end
    Price=Sum/n; 
end
clear n s K r sigma T B Sum