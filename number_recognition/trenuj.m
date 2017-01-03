function rozptyly = trenuj(verze,pocetcisel)  
    refsize=size(verze);
    rozptyly=zeros(refsize(1),refsize(2));
    prumery=rozptyly;
    for koncovka=1:refsize(1);
        for cislo=1:pocetcisel
            cesta=strcat(int2str(cislo),verze(koncovka,:));
            [Y,Fs]=wavread(cesta);
            [ref,zvuk]=parametry(Y);
            if(cislo==1)
                refs=ref;
            else
                refs=[refs,ref];    %spojeni pro vypocet rozptylu
            end
            %wavplay(zvuk,Fs);
            string=strcat(cesta,'.mat');
            save(string,'ref');
        end
    
        rozmery=size(refs);
       %% vypocist prumery parametru
         for p=1:rozmery(1)
            prumery(koncovka,p)=mean(refs(p,:));
         end
       %% vypocist rozptyly
         for p=1:rozmery(1)
             suma=0;
             for i=1:rozmery(2)
                 suma=suma+(refs(p,i)-prumery(koncovka,p))*(refs(p,i)-prumery(koncovka,p));
             end
             rozptyly(koncovka,p)=sqrt(suma/rozmery(2));
             rozptyly(koncovka,p)=1/rozptyly(koncovka,p);
         end
         %% ulozit mahanalobisem normovane priznaky
         for cislo=1:pocetcisel
            cesta=strcat(int2str(cislo),verze(koncovka,:),'.mat');
            load (cesta);
            rozmery=size(ref);
            for p=1:rozmery(1)
                ref(p,:)=ref(p,:)*rozptyly(koncovka,p);
            end
            save(cesta,'ref');
         end
    end
end