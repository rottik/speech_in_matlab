function prehrajFonem(x)
    %funkce prehraje soubor s fonemem
    disp(x);
    cesta=strcat(x,'.wav');
    [Y,Fs,NBITS]=wavread(cesta);
    wavplay(Y,Fs);
end