function prehrajSpojeniHodinaA(hodina)
    if(hodina<0 || hodina>23)
        disp('chyba');
        [Y,Fs,NBITS]=wavread('chyba.wav');
        wavplay(Y,Fs);
        return
    end
    if(hodina==1)
        disp('hodina a');
        [Y,Fs,NBITS]=wavread('hodinaa.wav');
        wavplay(Y,Fs);
    elseif(hodina==2 || hodina==3 || hodina==4)
        disp('hodiny a');
        [Y,Fs,NBITS]=wavread('hodinya.wav');
        wavplay(Y,Fs);
    else
        disp('hodin a');
        [Y,Fs,NBITS]=wavread('hodin-a.wav');
        wavplay(Y,Fs);
    end
end