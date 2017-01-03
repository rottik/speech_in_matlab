function detekujCislo(Y)
    P=2; %pocet parametru
    
    %nahraj neznamy
    wavplay(Y);
    %orez(Y);
    [e_Y,zcr_Y]=parametry(Y);
    YY=[e_Y;zcr_Y];

    vzdalenost=zeros(1,10);
    %projdi vsechny reference a pamatuj nejmensi vzdalenost
    [R,RFs,NBITS]=wavread(strcat(int2str(1),'b-MR.wav'));
    %wavplay(R,RFs);
    [e_R,zcr_R]=parametry(R);
    ref=[e_R;zcr_R];
    RLY=ComputeLTW(YY,ref,P);
    nejmensi=Euklid(YY,RLY,P);
    vzdalenost(1)=nejmensi;
    indexnejmensiho=1;
    i=2;
    while i<=10
        [R,RFs,NBITS]=wavread(strcat(int2str(i),'b-MR.wav'));
    %     wavplay(R,RFs);
        [e_R,zcr_R]=parametry(R);
        ref=[e_R;zcr_R];
        RLY=ComputeLTW(YY,ref,P);
        vzdalenost(i)=Euklid(YY,RLY,P);
        if(vzdalenost(i)<nejmensi)
            indexnejmensiho=i;
            nejmensi=vzdalenost(i);
        end
        i=i+1;
    end
    
    disp(strcat('slovo bylo rozpoznano jako cislo :',int2str(indexnejmensiho)));
    [R,RFs,NBITS]=wavread(strcat(int2str(indexnejmensiho),'a-MR.wav'));
    wavplay(R,RFs);
end