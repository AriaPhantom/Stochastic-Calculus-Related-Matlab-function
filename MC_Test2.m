N_=7;
X=zeros(1,N_);
Y=zeros(1,N_);
Z=zeros(1,N_);
for i=1:N_
    X=[100,1000,10000,50000,100000,400000,1000000];
    Y(i)=MC_Asian(X(i),100,106,100,0.03,0.3,1);
    Z(i)=MC_Asian_Ordinary(X(i),100,106,100,0.03,0.3,1);
end

plot(X,Y,X,Z);
xlabel('Times of simulation')
ylabel('Asian option price')
legend('Variation reduced MC','Ordinary MC');
grid on