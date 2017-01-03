function RT= ComputeLTW(Y,R,P)
    if(length(Y)==length(R))
        RT=R;
    else
        RT=zeros(P,length(Y));
        for i=1:length(RT)      
            wi=((length(R)-1)/(length(Y)-1))*(i-1)+1.5;
            wi=wi-mod(wi,1);
            for j=1:P                
                RT(j,i)=R(j,wi);
            end
        end
    end
end