c=[1;0.5;0.2];
sigb=0.01;
p=3;
Nrea=10;
TEB_moy=zeros(7,1);
Napp=10000;
d=[];
for n=1:Napp
    d(n)=sign(randn);
    moyd=mean(d.*d);
    RSB(n)=10*log10(mean(d.*d)/(sigv^2));
     varv=moyd/RSB(n);
    mat_varv(n)=varv;  
end



%mat_varb=zeros(7,1);
%for i=1:7
 %   moyd=mean(d.*d);
 %  varb=moyd/RSB(i);
 % mat_varb(i)=varb;
%end

for i=1:7
    TEB=channel_equalizer(c,p,mat_varb(i));
    TEB_mat(i)=TEB;
end


semilogy(RSB,TEB_moy,'o-r')





%  var=var(mat_TEB);
%  ecart=sqrt(var);
