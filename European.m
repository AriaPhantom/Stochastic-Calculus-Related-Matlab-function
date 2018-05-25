function price=European(S,T,K,r,sigma)

d1=(log(S*exp(r*T)/K)+(r+1/2*sigma^2)*T)/(sigma*sqrt(T));
d2=d1-sigma*sqrt(T);

price=S*normcdf(d1)-K*exp(-r*T)*normcdf(d2);