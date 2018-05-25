[Best_b,Core]=MC_b(100000,100,106,100,0.05,0.3,1);
disp('Optimal value of b: ');
disp(Best_b);
disp('Correlation: ')
disp(Core);

N_=7;
Y=zeros(1,N_);%store prices
Z=zeros(1,N_);%store errors
for i=1:N_
    X=[100,1000,10000,50000,100000,400000,1000000];
    [Y(i),Z(i)]=MC_Asian_with_Error(X(i),100,106,100,0.05,0.3,1);
end

disp('Variance Reduced MC Times of simulation: ');
disp(X);
disp('Price: ');
disp(Y);
disp('Standard Error: ');
disp(Z);

for i=1:N_
    X=[100,1000,10000,50000,100000,400000,1000000];
    [Y(i),Z(i)]=MC_Asian_Ordinary_with_Error(X(i),100,106,100,0.05,0.3,1);
end

disp('Ordinary MC Times of simulation: ');
disp(X);
disp('Price: ');
disp(Y);
disp('Standard Error: ');
disp(Z);