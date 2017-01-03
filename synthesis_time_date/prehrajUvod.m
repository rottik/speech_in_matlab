function prehrajUvod(cislo)
    %prehraje casovane slovo byt, dle nasledujiciho cisla cislo
    if((cislo==2) || (cislo==3) || (cislo==4))
        disp('Jsou ');
        [Y,Fs,NBITS]=wavread('jsou.wav');
        wavplay(Y,Fs);
    else
        disp('Je ');
        [Y,Fs,NBITS]=wavread('je.wav');
        wavplay(Y,Fs);
    end
end
    