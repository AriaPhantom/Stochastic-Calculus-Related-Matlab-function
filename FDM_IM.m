function [spot,price]=FDM_IM(R,T,K,r,sigma,N,M)
dt=T/N;
dx=R/M;
a=-1/2*dt*(sigma^2/dx^2)+dt*(r-(sigma^2)/2)/(2*dx);
b=1+dt*(r+sigma^2/(dx^2));
c=dt*(-(r-1/2*sigma^2)/(2*dx)-sigma^2/(2*dx^2));

a_h=zeros(2*M-1,1);
b_h=zeros(2*M-1,1);
c_h=zeros(2*M-1,1);
for i=1:2*M-1
    if i==1
        b_h(i)=b;
        c_h(i)=c;
    elseif i==2*M-1
        a_h(i)=a;
        b_h(i)=b;
    else
        a_h(i)=a;
        b_h(i)=b;
        c_h(i)=c;
    end
end

u=zeros(2*M+1,N+1);
spot=zeros(2*M+1,1);
for i=1:2*M+1
    u(i,1)=max(0,exp((i-M-1)*dx)-K);
    spot(i,1)=exp((i-M-1)*dx);
end

for i=0:N-1
    B=u(2:2*M,i+1);
    B(2*M-1)=B(2*M-1)+dt*(1/2*(sigma)^2/dx^2+(r-1/2*sigma^2)/(2*dx))*(exp(M*dx)-exp(-r*((i+1)*dt))*K);
    u(2:2*M,i+2)=TDMAsolver(a_h,b_h,c_h,B);    
    u(1,i+2)=0;
    u(2*M+1,i+2)=exp(M*dx)-exp(-r*((i+1)*dt))*K;    
end
price=u(:,N+1);


