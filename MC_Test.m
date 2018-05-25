Y=zeros(1,100001);
X=(1:0.01:1001);
alpha=0.1;
Y(1)=0.5;

for i=1:100000
Y(1+i)=Y(i)-alpha*alpha*Y(i)*Y(i)*(1-Y(i))*0.01+alpha*Y(i)*(1-Y(i))*randn(1)*0.1;
end

plot(X,Y);
