function [spot,price,stop_mat]=FDM_Amer_Put(R,T,K,r,sigma,N,M)
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
stop_mat=zeros(2*M+1,N+1);% To store whether the max was g or u
for i=1:2*M+1
    u(i,1)=max(0,K-exp((i-M-1)*dx));
    stop_mat(i,1)=1;
    spot(i,1)=exp((i-M-1)*dx);
end
intri_vector=max(0,K-spot);

for i=0:N-1
    B=u(2:2*M,i+1);
    B(1)=B(1)-a_h(1)*K*exp(-r*(i+1)*dt);
    u(2:2*M,i+2)=TDMAsolver(a_h,b_h,c_h,B);   
    u(1,i+2)=exp(-r*((i+1)*dt))*K;
    u(2*M+1,i+2)=0;
    stop_mat(:,i+2)=intri_vector>u(:,i+2);
    u(:,i+2)=max(u(:,i+2),intri_vector);    
end

price=u(:,N+1);


