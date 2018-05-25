function [Price,Error]=MC_Asian_with_Error(n,N,s,K,r,sigma,T)
%n simulation times
%N number of points
%s spot price
%K strike price
%r interest rate
%sigma implied volatility
%T time to maturity

[Best_b,~]=MC_b(10000,N,s,K,r,sigma,T);
%Best_b=0.9768;
Price_Vector=zeros(1,n);
Delta_t=T/N;
S_T=zeros(1,N+1);

Avg_T=(1+N)*Delta_t/2;
Avg_sigma_2=0;
for q=1:N
    Avg_sigma_2=Avg_sigma_2+(2*q-1)*(Delta_t*(N+1-q));
end

Avg_sigma_2=Avg_sigma_2*sigma^2/(Avg_T*N^2);
Delta=(sigma^2-Avg_sigma_2)/2;
d=(log(s/K)+(r-Delta+Avg_sigma_2/2)*Avg_T)/sqrt(Avg_sigma_2*Avg_T);

EX=exp(-Delta*Avg_T-r*(T-Avg_T))*s*normcdf(d)-exp(-r*T)*K*normcdf(d-sqrt(Avg_sigma_2*Avg_T));

for i=1:n
    S_T(1)=s;
    for q=1:N
        S_T(q+1)=S_T(q)*exp((r-(sigma^2)/2)*Delta_t+sigma*sqrt(Delta_t)*randn(1));
    end
    Price_Vector(i)=exp(-r*T)*max(mean(S_T)-K,0)-Best_b*(exp(-r*T)*max(geomean(S_T)-K,0)-EX);
end

Price=mean(Price_Vector);
Error=std(Price_Vector)/sqrt(n);

clear n s K r sigma T Sum
