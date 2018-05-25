[spot1,price1,stop_mat1]=FDM_Amer_Put(log(200),1,100,0.01,0.2,100,100);
[spot2,price2,stop_mat2]=FDM_Amer_Put(log(200),1,100,0.01,0.2,200,200);
[spot3,price3,stop_mat3]=FDM_Amer_Put(log(200),1,100,0.01,0.2,400,400);
[spot4,price4,stop_mat4]=FDM_Amer_Put(log(200),1,100,0.01,0.2,800,800);

Price_Matrix=zeros(1601,4);

Price_Matrix(1:201,1)=price1;
Price_Matrix(1:401,2)=price2;
Price_Matrix(1:801,3)=price3;
Price_Matrix(1:1601,4)=price4;

error_Matrix=zeros(1601,3);

for i=1:3
    error=zeros(100*2^i+1,1);
    for q=1:100*2^i+1
        error(q,1)=Price_Matrix(2*q-1,i+1)-Price_Matrix(q,i);
    end
    error_Matrix(1:100*2^i+1,i)=error;
end

error1=max(abs(error_Matrix(:,1)));
error2=max(abs(error_Matrix(:,2)));
error3=max(abs(error_Matrix(:,3)));

order1=log(error1/error2)/log(2);
order2=log(error2/error3)/log(2);


