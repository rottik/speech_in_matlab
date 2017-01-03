clear all;
clc;

string = '�esk� televize pod�v� trestn� ozn�men� kv�li p�te�n�mu z�sahu vojensk� policie';

for i=1:length(string)
    tmp=string(i);
    if(string(i)==' ')
        tmp='_';
    end
    if(string(i)=='C') %dz
        tmp='cc';
    end
    if(string(i)=='�') %d�
        tmp='��';
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
    if(string(i)=='�') %�
        tmp='��';
    end
    disp(tmp);
    cesta=strcat(tmp,'.wav');
    [Y,Fs,NBITS]=wavread(cesta);
    wavplay(Y,Fs);
end
