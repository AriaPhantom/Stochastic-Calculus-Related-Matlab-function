Ex=0;
Sum_p=0;

for i=1:100000
    p=sqrt(2)*randn();
    Sum_p=Sum_p+p;
    Ex=Ex+exp(random('norm',0,2));
end

disp(Sum_p/100000);
disp(Ex/100000);