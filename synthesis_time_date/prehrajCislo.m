function prehrajCislo(x)
    disp(x);
    if(x<0 || x>59)
        disp('chyba');
        [Y,Fs,NBITS]=wavread('chyba.wav');
        wavplay(Y,Fs);
        return
    end
    %funkce prehraje soubor s cislem
    cesta=strcat(int2str(x),'.wav');
    [Y,Fs,NBITS]=wavread(cesta);
    wavplay(Y,Fs);
end