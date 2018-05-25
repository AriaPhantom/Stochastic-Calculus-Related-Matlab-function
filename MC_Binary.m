
function Price=MC_Binary(n,s,K,r,sigma,T,Q)
%n simulation times
%s spot price
%K strike price
%r interest rate
%sigma implied volatility
%T time to maturity
%Q the amount of money paid if S_T>K 

Sum=0;
for i=1:n
    S_T=s*exp((r-sigma*sigma/2)*T+sigma*sqrt(T)*randn(1));
    if S_T>K
        Sum=Sum+exp(-r*T)*Q;
    end    
end
Price=Sum/n;
clear n s K r sigma T P




