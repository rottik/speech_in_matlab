function [D] = ComputeDTWitakuta(R,Y,P)
%    if(length(R)>2*length(Y) || length(Y)>2*length(R) )
%         D=inf;
%         return;
%    end
    A=zeros(length(R)+2,1);
    B=zeros(length(R)+2,1);
    %% inicializace vektoru
    %1. sloupec inf, az na index 3
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
        for j=length(A):-1:3
            if j<=max || j>=min
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
            else
               A(j)=inf; 
            end
        end
    end
    %% vyhodnoceni
    D=A(length(A));
end