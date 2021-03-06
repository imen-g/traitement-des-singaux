clear all;
close all;
% w0=0.05*pi;
% N=10^4;
% phi=rand*2*pi;
% Nrea=10;
% D_mat=[];
% 
% % tra�age de MOY_th et Puiss_th ainsi que la moyenne statistique et la puissance calcul�e
% for i=1:Nrea
% for n=1:N
%     phi=rand*2*pi;
%     x(n)=sin(n*w0+phi);
% end
% D_mat=[D_mat;x];
% end
% for i=1:N
%     MOY_stat=mean(D_mat);
%     Puiss_calc=mean(D_mat).*mean(D_mat);
% end
% 
% for i=1:N
%     MOY_th(i)=mean(x(1:i));
%     Puiss_th(i)=mean(x(1:i)).*mean(x(1:i));
% end

% figure(1)
% plot(MOY_stat,'r')
% hold on
% plot(MOY_th)
% hold on
% plot(Puiss_th,'g')
% hold on
% plot(Puiss_calc,'y')

[SIG,Fs,Nb]=wavread('kkl.wav');
% la segmentation
T0=0.1;T1=0.2;T2=0.003;
N0=floor(Fs*T0);N1=floor(Fs*T1);N2=floor(Fs*T2);
Ntr=floor(length(SIG)/N0);
sig=SIG(1:Ntr*N0);
seg=reshape(sig,N0,Ntr);
%calcule puiss et moy
MOY_ech=mean(seg);
Puiss_ech=mean(seg).*mean(seg);
subplot(2,1,1)
plot(MOY_ech)
title('la moyenne ech')
subplot(2,1,2)
plot(Puiss_ech)
title('la puissaance ech')