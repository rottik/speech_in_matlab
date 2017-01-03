function prehrajCislo2pad(x)
    disp(x);
    if(x<0 || x>31)
        disp('chyba');
        [Y,Fs,NBITS]=wavread('chyba.wav');
        wavplay(Y,Fs);
        return
    end
    %funkce prehraje soubor s cislem
    cesta=strcat(int2str(x),'ho.wav');
    [Y,Fs,NBITS]=wavread(cesta);
    wavplay(Y,Fs);
end