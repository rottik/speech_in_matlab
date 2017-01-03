function [spriz,pocet] = SPriznaky(Y)
    clc;clear all;
    [Y,Fs,NBITS]=wavread('1a-MR.wav');
    h=Hamming(160);
    pocet=0;
    
    l_spektra=length(Y)/80;
    if(mod(l_spektra,10)~=0)
        l_spektra=l_spektra-1;
    end
    
    spriz=zeros(8,length(Y)/l_spektra);

    frame1=zeros(1,256);
    frame2=zeros(1,256);
    for i=1:80
        frame1(i)=Y(i)*h(i);
    end    
    ktery=1;
    index1=81;
    index2=1;
    index=1;
    for i=81:length(Y)        
        frame1(index1)=Y(i)*h(index1);
        frame2(index2)=Y(i)*h(index2);
        index1=index1+1;
        index2=index2+1;
        if(mod(i,80)==0)
            if(ktery==1)
                sf1=fft(frame1);
                k=1;
                suma=0;
                for s=1:length(frame1)/2
                    suma=suma+abs(sf1(s));
                    if(mod(s,16)==0)
                        spriz(k,index)=log(suma);
                        suma=0;
                        k=k+1;
                    end       
                end
                index=index+1;
                index1=1;
                ktery=2;
            else
                sf2=fft(frame2);
                k=1;
                suma=0;
                for s=1:length(frame1)/2
                    suma=suma+abs(sf1(s));
                    if(mod(s,16)==0)
                        spriz(k,index)=log(suma);
                        suma=0;
                        k=k+1;
                    end       
                end
                index=index+1;
                index2=1;
                ktery=1;
            end
        end
    end
end
