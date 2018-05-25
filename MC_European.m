
function Price=MC_European(n,s,K,r,sigma,T)
%n simulation times
%s spot price
%K strike price
%r interest rate
%sigma implied volatility
%T time to maturity

Sum=0;

for i=1:n
    S_T=s*exp((r-sigma*sigma/2)*T+sigma*sqrt(T)*randn(1));
    P=max(0,exp(-r*T)*(S_T-K));
    Sum=Sum+P;
end
Price=Sum/n;
clear n s K r sigma T P




