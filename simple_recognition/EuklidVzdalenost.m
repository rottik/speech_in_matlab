function euLength = EuklidVzdalenost(x,r,P,indexI,indexJ)
    s=0;
    rozmery=size(x);
    if indexI>rozmery(2)
        indexI=rozmery(2);
    end
    for j=1:P
        s=s+(x(j,indexI)-r(j,indexJ))*(x(j,indexI)-r(j,indexJ));
    end            
    euLength=sqrt(s);
end