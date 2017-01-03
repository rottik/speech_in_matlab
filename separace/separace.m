clear all;
clc;
hit=0;
verze='a';
reference='b';
warning off all;
for n=1:10
    P=2; %pocet parametru
    
    %nahraj neznamy
    YY=parametry(wavread(strcat(int2str(n),verze,'-MR.wav')));    
    
    vzdalenost=zeros(1,10);
    %projdi vsechny reference a pamatuj nejmensi vzdalenost
    ref=parametry(wavread(strcat(int2str(1),reference,'-MR.wav')));
    
%     RLY=ComputeLTW(YY,ref,P);
%     vzdalenost(1)=Euklid(YY,RLY,P);
    vzdalenost(1)=ComputeDTWitakuta(ref,YY,P);
    indexnejmensiho=1;
    i=2;
    while i<=10
        [R,RFs,NBITS]=wavread(strcat(int2str(i),reference,'-MR.wav'));
    %     wavplay(R,RFs);
         ref=parametry(R);
       
%         RLY=ComputeLTW(YY,ref,P);
%         vzdalenost(i)=Euklid(YY,RLY,P);

        vzdalenost(i)=ComputeDTWitakuta(ref,YY,P);

        if(vzdalenost(i)<vzdalenost(indexnejmensiho))
            indexnejmensiho=i;
        end
        i=i+1;
    end
    
    disp(strcat('cislo', int2str(n) ,' bylo rozpoznano jako cislo :',int2str(indexnejmensiho)));
    if(indexnejmensiho==n)
        hit=hit+1;
    end
    [R,RFs,NBITS]=wavread(strcat(int2str(indexnejmensiho),reference,'-MR.wav'));
 %    wavplay(R,RFs);
end

disp(hit);

% % x1 = 1:length(YY);
% % x2 = 1:length(RLY);
% %      subplot(2,1,1);plot(x1,YY,'r')  , title('neznamy')
% %      subplot(2,1,2);plot(x2,RLY,'b') , title('reference')