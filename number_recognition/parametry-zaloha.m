function[priznaky,zvuk] = parametry(Y)
    X=zeros(1,length(Y));
    X(1)=Y(1)*32768;
    while(X(1)==0)
            X(1)=X(1)+rand(1)*2-1;
    end
    a=0.97;
    for i=2:length(Y)
        X(i)=32768*Y(i);
        X(i)=X(i)-a*X(i-1);
        while(X(i)==0)
            X(i)=X(i)+rand(1)*2-1;
        end
    end
    
    %vypocet energie a pruchodu nulou
    suma1=X(1)^2;
    ZCR1=0;
    for i=2:80
        suma1=suma1+X(i)^2;
        if(X(i)*X(i-1)>=0)
            ZCR1=ZCR1+1;
        end
    end
    
    ktera=1;
    suma2=0;
    ZCR2=0;
    j=1;
    v_energie=length(X)/80;
    if(mod(v_energie,10)~=0)
        v_energie=v_energie-1;
    end
    energie=zeros(1,v_energie)';
    ZCR_p=zeros(1,v_energie)';
    for i=81:length(X)
        suma1=suma1+X(i)^2;
        suma2=suma2+X(i)^2;
        if(X(i)*X(i-1)>=0)
            ZCR1=ZCR1+1;
            ZCR2=ZCR2+1;
        end
        if(mod(i,80)==0)
            if(ktera==1)
                energie(j)=log(suma1);
                ZCR_p(j)=ZCR1;
                ZCR1=0;
                suma1=0;
                ktera=2;
            else
               energie(j)=log(suma2);
                ZCR_p(j)=ZCR2;
                ZCR2=0;
                suma2=0;
                ktera=1;
            end
            j=j+1;
        end
    end
    
    max=zeros(1,10);
    min=[32768 32768 32768 32768 32768 32768 32768 32768 32768 32768];
    
    %urceni 10ti maxim a minim
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
    
    prah=0.2*((mean(max)+mean(min))/2)+mean(min);

    %nalezeni pocatku
    start=1;
    for i=1:length(energie)
        if(energie(i)>prah)
            start=i;
            break;
        end
    end
    
    %nalezeni konce
    konec=length(energie);
    for i=length(energie):-1:1
        if(energie(i)>prah)
            konec=i;
            break;
        end
    end
    
    %osekani parametru o ticho
    start=start-1;
    konec=konec+2;
    vystup_energie=zeros(1,length(energie)-start-konec);
    ZCR=zeros(1,length(vystup_energie));    
    j=1;
    for i=1:length(energie)
        if((i>start) && (i<konec))
            vystup_energie(j)=energie(i);
            ZCR(j)=ZCR_p(i);
            j=j+1;
        end
    end   
    
    %osekani zvuku o ticho
    start=start*80;
    konec=konec*80;
    zvuk=zeros(1,length(X)-start-konec);
    j=1;
    for i=1:length(Y)
        if((i>start) && (i<konec))
            zvuk(j)=Y(i);
            j=j+1;
        end
    end
     
    
    %vypocet dynamickych promenych
    staticke=[vystup_energie;ZCR];
    rozmery=size(staticke);
    delta=zeros(rozmery(1),rozmery(2));
    %d(i)=p(i+1)-p(i-1)
    for i=1:rozmery(2)  %cas
        for p=1:rozmery(1)  %parametry
            if(i==1)
                delta(p,i)=staticke(p,2)-staticke(p,1);
                continue;
            end
            if(i==length(staticke))
                delta(p,length(staticke))=staticke(p,length(staticke))-staticke(p,length(staticke)-1);
                continue;
            end
            delta(p,i)=staticke(p,i+1)-staticke(p,i-1);
        end
    end
    
   priznaky=[vystup_energie;ZCR;delta]; 
   % priznaky=[ZCR;delta];     
   % priznaky=[vystup_energie;delta]; 
   % priznaky=delta;
end