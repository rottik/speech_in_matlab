function prehrajSpojeniMinutaPoPulnoci(minuta)
    if(minuta==1)
        disp('minuta po pulnoci.');
        [Y,Fs,NBITS]=wavread('minuta-po.wav');
        wavplay(Y,Fs);
    elseif(minuta==2 || minuta==3 || minuta==4)
        disp('minuty po pulnoci.');
        [Y,Fs,NBITS]=wavread('minutypo.wav');
        wavplay(Y,Fs);
    else
        disp('minut po pulnoci.');
        [Y,Fs,NBITS]=wavread('minutpo.wav');
        wavplay(Y,Fs);
    end
end