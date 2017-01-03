%funkci na cteni minut
%funkci na cteni 

clc;
clear all;

cas=clock;
minuty=cas(5);
hodiny=cas(4);
hodiny=5;
if(hodiny ==0 && minuty==0)
    vystup='Je pulnoc'
    return
elseif(hodiny==0)
    %upravit pro ruzne minuty
    vystup=strcat('Je ', int2str(minuty),' minuty po pulnoci.');
    vystup
    return
end

if(hodiny==1)
    vystup='Je jedna';
    if(minuty==0)
        vystup=strcat(vystup,' hodina.');
    else
        vystup=strcat(vystup,' hodina a ',int2str(minuty),' minut.');
    end
    vystup
    return
end

if(hodiny==2 || hodiny==3 || hodiny ==4)
    vystup=strcat('Jsou ', int2str(hodiny));
    if(minuty==0)
        vystup=strcat(vystup,' hodiny.');
    else
        vystup=strcat(vystup,' hodiny a ',int2str(minuty),' minut.');
    end
    vystup
    return
end

vystup=strcat('Je ',int2str(hodiny));
if(minuty==0)
    vystup=strcat(vystup,' hodin.');
else
    vystup=strcat(vystup,' hodin a ',int2str(minuty),' minut.');
end
vystup