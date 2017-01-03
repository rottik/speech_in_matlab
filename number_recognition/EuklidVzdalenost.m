function euLength = EuklidVzdalenost(x,r,P,indexI,indexJ)
    s=0;
    for j=1:P
        s=s+(x(j,indexI)-r(j,indexJ))*(x(j,indexI)-r(j,indexJ));
    end            
    euLength=sqrt(s);
end