function prehrajSlovoMinuta(minuta)
    if(minuta==1)
        disp('minuta');
        [Y,Fs,NBITS]=wavread('minuta.wav');
        wavplay(Y,Fs);
    elseif(minuta==2 || minuta==3 || minuta==4)
        disp('minuty');
        [Y,Fs,NBITS]=wavread('minuty.wav');
        wavplay(Y,Fs);
    else
        disp('minut');
        [Y,Fs,NBITS]=wavread('minut.wav');
        wavplay(Y,Fs);
    end
end