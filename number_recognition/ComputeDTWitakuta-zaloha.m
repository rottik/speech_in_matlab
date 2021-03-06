function [D] = ComputeDTWitakuta(R,Y,P)
%clc;clear all;;
   % R=[2 5 2 6 2 1];
   % Y=[1 4 5 2 3 7 6 1];
   % P=1;
   if(length(R)>2*length(Y) || length(Y)>2*length(R) )
        D=inf;
        return;
   end
    A=zeros(length(R)+2,length(Y));
    B=zeros(length(R)+2,length(Y));
    %% inicializace matice
    %1. sloupec inf, 1. a 2. radek inf
    %skutecny j zacina na indexu 3
    A(3,1)=EuklidVzdalenost(Y,R,P,1,3);
    B(3,1)=0;
    for j=4:length(R)+2
        A(j,1)=inf;
    end
    for i=1:length(Y)
        A(1,i)=inf;
        A(2,i)=inf;
    end
    %% vlastni vypocet
    for i=2:length(Y)
        for j=3:length(R)+2
            if A(j-1,i-1) < A(j-2,i-1)
                o=A(j-1,i-1);
                b=j-1;
            else
                o=A(j-2,i-1);
                b=j-2;
            end 
            if B(j,i-1)~=j
               if A(j,i-1)<o
                   o=A(j,i-1);
                   b=j;
               end
            end
            B(j,i)=b;
            A(j,i)=EuklidVzdalenost(Y,R,P,i,j-2)+o;
        end
    end
    %% vyhodnoceni
    D=A(length(R)+2,length(Y));
%end