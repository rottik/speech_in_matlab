%pridat vice referenci
clear all;
clc;
hit=0;
pocetcisel=9;
verze='JN-B.wav';
reference=['a-MR.wav' ; 'b-MR.wav' ; 'c-MR.wav' ; 'f-MR.wav'];
warning off all;
disp('vytvarim slovnik');
t1=clock;
rozptyly=trenuj(reference,pocetcisel);   %trenuj reference
t2=clock;
time=etime(t2,t1);
disp(strcat('slovnik vytvoren za',' ',int2str(time),' s'));
sr=size(rozptyly);
vzdalenost=zeros(sr(1),pocetcisel);
n=1;
%for n=1:pocetcisel   
    t1=clock;
    %nahraj neznamy, analyzuj ho
    [Y,Fs,NBITS]=wavread(strcat(int2str(n),verze));
    [neznamy,zvuk]=parametry(Y);        
    YY=neznamy;
    for koncovka=1:sr(1)
        rozmery=size(neznamy);
      %% normovani
        for p=1:sr(2)
            YY(p,:)=neznamy(p,:)*rozptyly(koncovka,p);
        end
        %hledani nejmensi diference
        for i=1:pocetcisel
            load (strcat(int2str(i),reference(koncovka,:),'.mat')); %ziskam promenou ref    
            rozmery=size(ref);
            P=rozmery(1);
            vzdalenost(koncovka,i)=ComputeDTWitakuta(ref,YY,P);
        end
    end
    %% vyhledej nejmensi velikost
    nejmensi=inf;
    index=1;
    sada=1;
    for r=1:sr(1)
        for i=1:pocetcisel
            if(nejmensi>vzdalenost(r,i))
                index=i;
                sada=r;
                nejmensi=vzdalenost(r,i);
            end
        end
    end
        disp('------------------------------------');
    disp(strcat(int2str(n) ,' bylo rozpoznano jako cislo :',int2str(index)));
    disp(strcat ('pomoci sady:',' ',reference(sada,:)));
    if(index==n)
             hit=hit+1;
    end
    %% vypocet casu
        t2=clock;
        time=etime(t2,t1);
        disp('cas potrebny pro vypocet je: ');
        disp(time);
%end
     disp('------------------------------------');
     disp(strcat('pocet spravnych rozpoznani:',int2str(hit)));