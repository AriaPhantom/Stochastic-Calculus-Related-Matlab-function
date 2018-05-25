function Price=Amer_Put_Option_Bi(s,K,r,q_up,N,u,d)
%s spot price
%K strike price
%r interest rate for a time interval
%q_up risk neutral probabilities for the up states
%N step
%u go up by a factor u
%d go down by a factor d

Price_Matrix=zeros(N+1,N+1);

for i=1:N+1
    Price_Matrix(N+1,i)=max(K-(d^(i-1))*s*(u^(N+1-i)),0);
end
for i=N:-1:1
    for q=1:i
        tmp_val=((1-q_up)*Price_Matrix(i+1,q+1)+q_up*Price_Matrix(i+1,q))/(1+r);
        Price_Matrix(i,q)=max(tmp_val,max(K-s*u^(i-q)*d^(q-1),0));
    end
end

Price=Price_Matrix(1,1);
