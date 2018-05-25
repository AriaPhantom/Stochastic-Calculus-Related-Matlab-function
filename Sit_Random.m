function Sit_Random(people)
count=0;

for i=1:10000
    a=randperm(people);
    for q=1:people
        if(a(q)==q)
            count=count+1;
        end
    end
end

Exp=count/10000;
disp(Exp);