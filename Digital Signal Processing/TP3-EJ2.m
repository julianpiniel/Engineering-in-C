%%
% DSP
% tp3: muestreo
% EJERCICIO 2 
%% inciso A
% grafico xc y Xc
clc; 
clear all;
% defino t de -5 ms a 5 ms y F de -2 khz a 2 khz


t=[-0.005:0.0001:0.005];

F=[-2000:1:2000];

xc=exp(-abs(1000*t));


Xc=(0.002)./(1+(0.002*pi*F).^2);

subplot(2,1,1)
plot(t,xc)
xlabel('Tiempo [seg]');
ylabel('xc(t)');
title('Se�al de tiempo continuo');

subplot(2,1,2)
plot(F,Xc)
xlabel('Frecuencia [Hz]');
ylabel('Xc(F)');
title('Espectro en frecuencia de la se�al de tiempo continuo');



%% INCISO B

% funcion x muestreada con Fs=1000 muestras/seg
n=[-5:0.1:5];

xn=exp(-abs(n));

subplot(2,1,1);
stem(n,xn);

xlabel('Tiempo[n]');
ylabel('x(n)');
title('Se�al muestreada de tiempo discreto');

LF=length(F);

% la transformo

Xn=fftshift(fft(xn,LF)/LF);


for i=1:LF
    F(i)=F(i)./(1000*(2*pi));
end
subplot(2,1,2);
stem(F,abs(Xn));
xlabel('Frecuencia [Hz]');
ylabel('X(F)');
title('Espectro en frecuencia de la se�al muestreada');
%% INCISO D
   % reconstruir la se�al con un DAC

    tc=[-0.005:0.0001:0.005];
t=linspace(-0.005,0.005,201);
%Defino la sinc
gBL=sinc(pi*n*1000);
  

%encuentro la se�al reconstruida como la convolucion de la se�al muestreada
%y la sinc
   
   yr=conv(xn,gBL);
   % grafico la se�al original y la reconstruida
    subplot(2,1,2);
    plot(t,yr);
    ylim([0 1]);
    xlim([-0.005 0.005]);
    xlabel('Tiempo [seg]');
ylabel('yr(t)');
title('Se�al reconstruida de tiempo continuo');
   subplot(2,1,1);
   plot(tc,xc);
   xlabel('Tiempo [seg]');
ylabel('xc(t)');
title('Se�al de tiempo continuo');
%% INCISO C
% funcion x muestreada con Fs=5000 muestras/seg
n=[-5:0.1:5];

xn=exp(-abs(n/5));

subplot(2,1,1);
stem(n,xn);
xlabel('Tiempo[n]');
ylabel('x(n)');
title('Se�al muestreada de tiempo discreto');

LF=length(F);

% la transformo

Xn=fftshift(fft(xn,LF)/LF);

for i=1:LF
    F(i)=F(i)./(5000*(2*pi));
end
subplot(2,1,2);
stem(F,abs(Xn));
xlabel('Frecuencia [Hz]');
ylabel('X(F)');
title('Espectro en frecuencia de la se�al muestreada');
%% INCISO E
   
   






