function [D] = ComputeDTWitakuta(R,Y,P)
% clc;clear all;
%     R=[2 5 2 6 2 1];
%     Y=[1 4 5 2 3 7 6 1];
%     P=1;
   if(length(R)>2*length(Y) || length(Y)>2*length(R) )
        D=inf;
        return;
   end
    A=zeros(length(R)+2,1);
    B=zeros(length(R)+2,1);
    %% inicializace matice
    %1. sloupec inf, 1. a 2. radek inf
    %skutecny j zacina na indexu 3
    for j=1:length(A)
        if (j~=3)
            A(j)=inf;
        else            
            A(j)=EuklidVzdalenost(Y,R,P,1,j);
        end
        B(j)=0;
    end
    %%
    for i=2:length(Y)
        %% zjisteni mezi
        min=(i-1)/2;
        min=min-mod(min,1);
        k1=length(R)-1-(length(Y)-i)*2;
        if min<k1
            min=k1;
        end
        min=min+3;
        k1=2*i-1;
        max=length(R)-1-(length(Y)-i)/2;
        max=max-mod(max,1);
        if max > k1
            max=k1;
        end
        max=max+3;
        %min=3;
        %max=length(A);
        %% vypocet vektoru newA a B
        for j=max:-1:min
            if A(j-1) < A(j-2)
                o=A(j-1);
            else
                o=A(j-2);
            end 
            b=0;
            if B(j)~=1
               if A(j)<o
                   o=A(j);
                   b=1;
               end
            end
        B(j)=b;
        A(j)=EuklidVzdalenost(Y,R,P,i,j-2)+o;
        end
        for j=min-1:-1:1
            A(j)=inf;
        end
    end
    %% vyhodnoceni
    D=A(length(A));
end