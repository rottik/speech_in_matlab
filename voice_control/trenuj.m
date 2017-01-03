function rozptyly = trenuj(verze,pocetcisel)  
%rozptyly jsou ve skutecnosti smerodatne odchylky na -1
    refsize=size(verze);
    rozptyly=zeros(refsize(1),refsize(2));
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
            string=strcat(cesta,'.mat');
            save(string,'ref');
        end
        rozmery=size(refs);
       %% vypocist rozptyly
         for p=1:rozmery(1)
             rozptyly(koncovka,p)=1/std(refs(p,:),1);
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