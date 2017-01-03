function euklid = Euklid(Y,R,P)
    euklid=0;
    if(length(Y)==length(R))
        for i=1:length(Y)         
            euklid=euklid+EuklidVzdalenost(Y,R,P,i);
        end
    else
        disp('proved ltw');
    end
    
end