function prehrajCas(hodiny,minuty)
    if(hodiny==0) 
        if(minuty==0)
            prehrajUvod(5);
            disp('pulnoc.');
            [Y,Fs,NBITS]=wavread('pulnoc.wav');
            wavplay(Y,Fs);
            return;
        else
            prehrajUvod(minuty);
            prehrajCislo(minuty);
            prehrajSpojeniMinutaPoPulnoci(minuty);
        end
        return
    end
    if(minuty==0)
        prehrajUvod(hodiny);
        prehrajCislo(hodiny);
        prehrajSlovoHodina(hodiny);
    else          
        prehrajUvod(hodiny);
        prehrajCislo(hodiny);
        prehrajSpojeniHodinaA(hodiny);            
        prehrajCislo(minuty);
        prehrajSlovoMinuta(minuty);
    end
end