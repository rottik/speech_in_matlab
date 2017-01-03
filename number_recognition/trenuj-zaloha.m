function rozptyly = trenuj(verze)  
    %clc;verze='b';
    for cislo=1:10
        [Y,Fs]=wavread(strcat(int2str(cislo),verze,'-MR.wav'));
        [ref,zvuk]=parametry(Y);
        if(cislo==1)
            refs=ref;
        else
            refs=[refs,ref];    %spojeni pro vypocet rozptylu
        end
        %wavplay(zvuk,Fs);
        string=strcat(int2str(cislo),verze,'-MR.mat');
        save(string,'ref');
    end
    
    %rozptyl na spojenych referencich
    rozmery=size(refs);
    prumery=zeros(1,rozmery(1));
     %% vypocist prumery parametru
     for p=1:rozmery(1)
        prumery(p)=mean(refs(p,:));
     end
     %% vypocist rozptyly
     rozptyly=zeros(1,rozmery(1));
     for p=1:rozmery(1)
         suma=0;
         for i=1:rozmery(2)
             suma=suma+(refs(p,i)-prumery(p))*(refs(p,i)-prumery(p));
         end
         rozptyly(p)=sqrt(suma/rozmery(2));
         rozptyly(p)=1/rozptyly(p);
     end
     %% ulozit mahanalobisem normovane priznaky
     for cislo=1:10
        cesta=strcat(int2str(cislo),verze,'-MR.mat');
        load (cesta);
        rozmery=size(ref);
        for p=1:rozmery(1)
            ref(p,:)=ref(p,:)*rozptyly(p);
        end
        save(cesta,'ref');
    end
end