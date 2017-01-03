function normovane=mahalanobis(parametry)
     rozmery=size(parametry);
     normovane=zeros(rozmery(1),rozmery(2));
     prumery=zeros(1,rozmery(1));
     %vypocist prumery parametru
     for p=1:rozmery(1)
        prumery(p)=mean(parametry(p,:));
     end
     %vypocist rozptyly
     rozptyly=zeros(1,rozmery(1));
     for p=1:rozmery(1)
         suma=0;
         for i=1:rozmery(2)
             suma=suma+(parametry(p,i)-prumery(p))^2;
         end
         rozptyly(p)=suma/rozmery(2);
     end     
end