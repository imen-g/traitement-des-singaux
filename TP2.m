close all
clear all

[d,fe,Nbits]=wavread('kkl.wav');
%sound(d)
sigv=0.1;p=10;taille=3e-3;
d=(d(:,1)+d(:,2))/2;
Nd=length(d);
temps=Nd/fe;
% ------------------------ Decomposition en trammes --------------------------------
nbr_tr=floor(temps/taille); long_tr=Nd/nbr_tr; k=1; gain_tr=[];tab_EQM=[];
sig_rec=[]; dt=[];
%for i=1:nbr_tr
tr=d(k:k+floor(long_tr)+1); %decomp
N=length(tr);
v=sqrt(sigv)*randn(1,N); %bruit
x=tr'+v; %le signal bruité
rd=xcorr(tr,p-1);
rd=rd/(N-p+1);
rd=rd(p:2*p-1);
Rd=toeplitz(rd);
Rx=Rd+sigv*eye(p);
InvRx=inv(Rx); 
wopt=inv(Rx)*rd;
% ------------ calcul de l'EQMmin --------------------------
EQMmin=rd(1)-(wopt'*rd);
%tab_EQM(i)=EQMmin;
%-------------------------------------------------------------
%------RSB avant débruitage-----------------------------------------------
RSBav=10*log(rd(1)/sigv);
%-----RSB apres débruitage------------------------------------------------
RSBap=10*log((wopt'*Rd*wopt)/(wopt'*sigv*eye(p)*wopt));
%-----gain----------------------------------------------------------------
gain=RSBap-RSBav;
%gain_tr(i)=gain;

%k=k+floor(long_tr);
%end
% figure(1)
% hist(gain_tr)
% title('la distribution du gain');
% figure(2)
% hist(tab_EQM);
% title('la distribution de EQM');

% l=1:nbr_tr;
% aq=0.0201;
% plot(tab_EQM,'r');
% hold on
% plot(l,aq,'*');
% legend('EQMmin avec décomposition en trammes','EQMmin sans decomposition
% en trammes')



% sound(sig_rec)
% plot(sig_rec)
% 
% %---------------filtrage opt-----------
% Xn=zeros(p,1);
% for n=1:N
%  Xn=[tr(n);Xn(1:p-1)];
%  dt(n)=wopt'*Xn;
% end
% %---reconstruction------------------
% sig_rec=[sig_rec,dt]
% %------------------------------------












% ----------- Q3: calcul de eqm(k)  ----------------------------
% Xn1=zeros(p,1);
% for n=1:N
%     Xn=[x(n);Xn(1:p-1)];
%     dt(n)=wopt1'*Xn;
% end
% 
% eqm=[];
% for k=1:N
%     eqmc(k)=0;
%     for j=1:k
%         eqmc(k)=eqmc(k)+((d(j)-dt(j))^2);
%     end
%     eqm(k)=eqmc(k)/k; 
%end






% t=1:N;
% plot(t,eqm1)
% hold on
% plot(t,eqm2,'r')
% hold on
% plot(t,eqm3,'g')
% hold on
% plot(t,eqm4,'y')
% hold on
% plot(t,eqm5,'k')
% hold on
% plot(t,EQMmin1)
% hold on
% plot(t,EQMmin2,'r')
% hold on
% plot(t,EQMmin3,'g')
% hold on
% plot(t,EQMmin4,'y')
% hold on
% plot(t,EQMmin5,'k')
% legend('sigv=0.1','sigv=0.01','sigv=0.05','sigv=0.5','sigv5=1')
% 
%---- Q5: On fait varier P de 5 à 50 avec un pas de 5---------------------
% P=5:5:50
% %pour p=5
% Xn2=zeros(p2,1);
% for n=1:N
%     Xn2=[x(n);Xn2(1:p2-1)];
%     dt2(n)=wopt2'*Xn2;
% end
% 
% eqm2=[];
% for k=1:N
%     eqmc(k)=0;
%     for j=1:k
%         eqmc(k)=eqmc(k)+((d(j)-dt2(j))^2);
%     end
%     
%     eqm2(k)=eqmc(k)/k;
%     
% end
% %pour p=3
% Xn3=zeros(p3,1);
% for n=1:N
%     Xn3=[x(n);Xn3(1:p3-1)];
%     dt3(n)=wopt3'*Xn3;
% end
% 
% eqm3=[];
% for k=1:N
%     eqmc(k)=0;
%     for j=1:k
%         eqmc(k)=eqmc(k)+((d(j)-dt3(j))^2);
%     end
%     
%     eqm3(k)=eqmc(k)/k;
%     
% end
% 
% plot(t,EQMmin1)
% hold on
% plot(t,eqm1)
% hold on
% plot(t,EQMmin2,'r')
% hold on
% plot(t,eqm2,'r')
% hold on
% plot(t,EQMmin3,'g')
% hold on 
% plot(t,eqm3,'g')
% 
% rmq: on affiche la courbe de eqm pour p=5,p=3 et p=10
% 
% --------------------------------------------------------------------
% 
% p=10;
% p=5;
% p=3;
% ---------------------------------------------------------------
% sound(d)
% figure(1)
% plot(d)
% 
%
% ----------------------------------------------------------------
% 
% 
% 

