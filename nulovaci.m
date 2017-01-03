clear all;
Nulovaci=zeros(1,8000);
omg1=pi/4;
omg2=pi/3;
N=length(Nulovaci);
for i=1:8000
    Nulovaci(i)=(omg2/pi)*sinc((omg2*((i-1)-0.5*N))/pi)-(omg1/pi)*sinc((omg1*((i-1)-0.5*N))/pi);
end

plot(Nulovaci);