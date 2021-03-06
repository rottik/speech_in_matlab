function orez(Y,Fs)
    X=zeros(1,length(Y));
    X(1)=Y(1)*32768;
    a=0.97;
    for i=2:length(Y)
        X(i)=32768*Y(i);
        X(i)=X(i)-a*X(i-1);
        while(X(i)==0)
            X(i)=X(i)+rand(1)*2-1;
        end
    end
    
    suma1=0;
    for i=1:80
        suma1=suma1+X(i)^2;
    end
    
    ktera=1;
    suma2=0;
    j=1;
    v_energie=length(X)/80;
    if(mod(v_energie,10)~=0)
        v_energie=v_energie-1;
    end
    energie=zeros(1,v_energie);
    for i=81:length(X)
        suma1=suma1+X(i)^2;
        suma2=suma2+X(i)^2;
        if(mod(i,80)==0)
            if(ktera==1)
                energie(j)=log(suma1);
                suma1=0;
                ktera=2;
            else
               energie(j)=log(suma2);
                suma2=0;
                ktera=1;
            end
            j=j+1;
        end
    end
    
    max=zeros(1,10);
    min=[32768 32768 32768 32768 32768 32768 32768 32768 32768 32768];
    
    for i=1:length(energie);    
        %najdi maxima
        if(energie(i)>max(1))
            max(1)=energie(i);
            %najdi nejmensi maximum
            for j=2:length(max);
                if(max(j)<max(1))
                    tmp=max(1);
                    max(1)=max(j);
                    max(j)=tmp;
                end
            end
        end    
        %najdi minima
         if(energie(i)<min(1))
            min(1)=energie(i);
            %najdi nejvetsi minimum
            for j=2:length(min);
                if(min(j)>min(1))
                    tmp=min(1);
                    min(1)=min(j);
                    min(j)=tmp;
                end
            end
         end
    end
    
    prah=0.1*((mean(max)+mean(min))/2)+mean(min);
    
    for i=1:length(energie)
        prahy=prah;
    end
    
    x = 1:length(energie);
    subplot(2,1,1);plot(x,energie,'r',x,prahy)  , title('puvodni')

    start=1;
    for i=1:length(energie)
        if(energie(i)>prah)
            start=i;
            break;
        end
    end
    
    konec=length(energie);
    for i=length(energie):-1:1
        if(energie(i)>prah)
            konec=i;
            break;
        end
    end
    
    start=start-1;
    konec=konec+2;
    
    j=1;
    
    vystup_energie=zeros(1,length(energie)-start-konec);   
    for i=1:length(energie)
        if((i>start) && (i<konec))
            vystup_energie(j)=energie(i);
            j=j+1;
        end
    end
    
    x = 1:length(vystup_energie);
    subplot(2,1,2);plot(x,vystup_energie,'r') , title('orez')
    
    start=start*80;
    konec=konec*80;
    
    j=1;
    vystup=zeros(1,length(Y)-start-konec);
    for i=1:length(X)
        if((i>start) && (i<konec))
            vystup(j)=Y(i);
            j=j+1;
        end
    end
    wavplay(vystup,Fs);
    
end