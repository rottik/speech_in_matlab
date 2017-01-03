function vystup = deltaParametry(parametry)
    rozmery=size(parametry);
    vystup=zeros(rozmery(1),rozmery(2));
    %d(i)=p(i+1)-p(i-1)
    for i=1:rozmery(2)  %cas
        for p=1:rozmery(1)  %parametry
            if(i==1)
                vystup(p,i)=parametry(p,2)-parametry(p,1);
                break;
            end
            if(i==length(parametry))
                vystup(p,length(parametry))=parametry(p,length(parametry))-parametry(p,length(parametry)-1);
                break;
            end
            vystup(p,i)=parametry(p,i+1)-parametry(p,i-1);
        end
    end
end