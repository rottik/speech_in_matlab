clear all;
clc;

string = 'èeská televize podává trestní oznámení kvúli páteènímu zásahu vojenské policie';

for i=1:length(string)
    tmp=string(i);
    if(string(i)==' ')
        tmp='_';
    end
    if(string(i)=='C') %dz
        tmp='cc';
    end
    if(string(i)=='È') %dž
        tmp='èè';
    end
    if(string(i)=='E') %neutralni samohlaska
        tmp='ee';
    end
    if(string(i)=='M') %m
        tmp='mm';
    end
    if(string(i)=='N') %n
        tmp='nn';
    end
    if(string(i)=='Ø') %ø
        tmp='øø';
    end
    disp(tmp);
    cesta=strcat(tmp,'.wav');
    [Y,Fs,NBITS]=wavread(cesta);
    wavplay(Y,Fs);
end
