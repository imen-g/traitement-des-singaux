
for k=1:10
N=10^4;
sigb=0.1;
b=sqrt(sigb)*randn(1,N);
c=[1;0.2;0.5];
for n=3:N
    d(n)=sign(randn);
    D=[d(n);d(n-1);d(n-2)];
    y(n)=c'*D+b(n);
end

Napp=2000;
w0=zeros(p,1);
Y=zeros(p,1);
muc=10^-2;

for n=1:Napp
    d_ch=w0'*Y;
    e(n)=d(n)-d_ch;
    w0=w0+muc*e(n)*Y;
    Y=[y(n);Y(1:p-1)];
   moyd=mean(d.*d);
    RSB(n)=10*log10(mean(d.*d)/(sigv^2));
     varv=moyd/RSB(n);
    mat_varv(n)=varv;  
end

nbr_err=0;

for n=Napp:N
    d_ch=w0'*Y;
    out(n)=sign(d_ch);
    e(n)=d(n)-out(n);
    Y=[y(n);Y(1:p-1)];
    if (e(n)==0)
        e(n)=0
    else
        nbr_err=nbr_err+1;
    end
   
wf=w0;
TEB=nbr_err/(N-Napp);
end
TEB_mat(k)=TEB;
end
figure(1)
plot(d)
hold on;
plot(y,'g')
legend('courbe de d','courbe de y')
figure(2)
plot(wn(1,:),'k')
hold on
plot(wn(2,:),'y')
hold on
plot(wn(3,:),'r')
title('wn pour p=3 et mu=0.1');
semilogy(RSB,TEB_mat,'o-r')

% figure(2)
% plot(d)
% hold on
% plot(d_ch,'r')
% legend('le signal d','le signal d_ch')

 
% plot(wn(1,:),'k')
% hold on
% plot(wn(2,:),'y')
% hold on
% plot(wn(3,:),'r')
% title('wn pour p=20 et mu=0.1')





