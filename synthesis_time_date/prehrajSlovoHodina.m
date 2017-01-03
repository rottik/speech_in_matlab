function prehrajSlovoHodina(hodina)
    if(hodina<0 || hodina>23)
        disp('chyba');
        [Y,Fs,NBITS]=wavread('chyba.wav');
        wavplay(Y,Fs);
        return
    end
    if(hodina==1)
        disp('hodina');
        [Y,Fs,NBITS]=wavread('hodina.wav');
        wavplay(Y,Fs);
    elseif(hodina==2 || hodina==3 || hodina==4)
        disp('hodiny');
        [Y,Fs,NBITS]=wavread('hodiny.wav');
        wavplay(Y,Fs);
    else
        disp('hodin');
        [Y,Fs,NBITS]=wavread('hodin.wav');
        wavplay(Y,Fs);
    end
end