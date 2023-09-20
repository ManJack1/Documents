function zhangjisuan2101
disp('��Ϣ������ѧ����ʵ������')
disp('----��ֵ�����γ����----')
disp('---��Ϣ2101��----�ż���----')
disp('---�����������---')
pause
disp('ʵ��1  19�η�ϵ���Է��̸���Ӱ��')
tic
bingtaiwenti
t(1)=toc;
disp('---�������������һ��---')
pause
close
disp('ʵ��2  ��Jacobi����Գƾ��������ֵ����������')
tic
tezhjcobi
t(2)=toc;
disp('---�������������һ��---')
pause
close
disp('ʵ��3  ����������ֵ������ط�')
tic
sancispli1
t(3)=toc;
disp('---�������������һ��---')
pause
close
disp('ʵ��4  ţ�ٲ�ֵ��')
tic
Newdchz
t(4)=toc;
fprintf('\n\t������CPU��ʱ����:\n')
for i=1:4
    fprintf('\t����%2.1d��ʱΪ:\t%1.5f��\n',i,t(i))
end
disp('---���г�����ʾ���---')
function bingtaiwenti
Numb=19;
ess=1e-8;
ve=zeros(1,21);
ve(21-Numb)=ess;
a=1:20;y=zeros(1,20);
xs=poly(a);
cpshu=zeros(1,20);
for i=1:1:20
    bxg=[1:20];
    bxg=bxg-i;
    bxg(i)=[];
    cpshu(i)=abs(i^(Numb-1)/prod(bxg)*xs(21-Numb));
end
zdxb=min(find(cpshu==max(cpshu)));
for i=1:20
    an(i)=a(21-i);
end
root=roots(xs+ve);
plot(a,y,'bo','LineWidth',2);
hold on;
if isreal(root)==1
   plot(root,y,'r+','LineWidth',2);
else
  plot(root,'r+','LineWidth',2);  
end
legend('�Ŷ�ǰ�Ľ�','�Ŷ���Ľ�',0);
hold off;
disp(['��',num2str(Numb),'������Ŷ�',num2str(ess),'�õ���ȫ����Ϊ��',]);
for i=1:length(root)
    if imag(root(i))<0
      fprintf('\tx%2d=%2.4f%2.4fi\n',i,real(root(i)),imag(root(i)));
   else
      fprintf('\tx%2d=%2.4f+%2.4fi\n',i,real(root(i)),imag(root(i)));
   end
end
disp(['ƫ�����ĸ��ǵ�',num2str(zdxb),'����']);
disp(['�Ŷ�ǰΪ��',num2str(zdxb)]);
disp(['�Ŷ���Ϊ��',num2str(root(21-zdxb))]);
disp(['��Ӧ��������Ϊ��',num2str(cpshu(zdxb))]);
disp(['ʵ�����Ϊ��',num2str(abs(root(21-zdxb)-an(21-zdxb)))]);
function tezhjcobi
a(:,:,1)=[5 2 4;2 5 3;4 3 1];
a(:,:,2)=[3 5 -1;5 2 9;-1 9 3];
a(:,:,3)=[2 1 3;1 2 6;3 6 1];
wuch=[1e-5;1e-6;1e-9];
for i=1:3
    A=a(:,:,i);
   [lm vecter k]=jcobitezh(A,wuch(i));
   disp('���۵ľ���Ϊ:');
   n=size(A,2);N=num2str(ceil(abs(log10(wuch(i)))));
   s0=['\t%2.',N,'f\t'];
  for u=1:n
     for v=1:n
        fprintf(s0,A(u,v));  
     end
        fprintf('\n');
  end
  fprintf('Ҫ�����Ϊ:%1.4g\n',wuch(i));
  fprintf('��������:%2d\n',k);
  for j=1:size(a,1)
     disp(['��',num2str(j),'������ֵΪ:',num2str(lm(j))]);
     disp(['��Ӧ����������Ϊ:',num2str(vecter(:,j)')]);
  end
end
function [lm,vecter,k]=jcobitezh(a,err)
n=size(a,1);
vecter=eye(n);
k=0;
while max(max(abs(triu(a,1))))>err;
[p q]=find(max(max(abs(triu(a,1))))==abs(triu(a,1)));
theta=acot((a(p(1),p(1))-a(q(1),q(1)))/a(p(1),q(1))/2)/2;
u=eye(n);
u(p(1),p(1))=cos(theta);u(q(1),q(1))=u(p(1),p(1));
u(p(1),q(1))=-sin(theta);u(q(1),p(1))=-u(p(1),q(1));
a=u'*a*u;vecter=vecter*u;
k=k+1;
end
lm=diag(a);
function Newdchz
x=[0.017037, 0.146447, 0.370590, 0.629410, 0.853553, 0.982963];
y=[1.017183, 1.157713, 1.448590, 1.876502, 2.347975, 2.672363];
xt=[0.017037,0.155026,0.293016,0.431005,0.500000,0.568995,0.706984,0.844974,0.982963];
[c,yt]=newdcz(x,y,xt);
n=length(x);
disp('��������ĸ��ײ���ϵ��Ϊ:')
for i=1:n
fprintf('\tc%d=%1.6f\n',i-1,c(i));
end
fprintf('\n');
disp('   ָ���㴦�ĺ���ֵΪ:')
for i=1:length(xt)
    fprintf('\tN%1d(%1.6f)=%1.6f\n',n-1,xt(i),yt(i))
end

function [c,yt]=newdcz(x,y,xt)
n=length(x);c=y;
for i=1:n-1
    for k=n:-1:i+1
        c(k)=(c(k)-c(k-1))/(x(k)-x(k-i));
    end
end
for i=1:length(xt)
    yt(i)=c(n);
    for k=1:n-1
        yt(i)=yt(i)*(xt(i)-x(n-k))+c(n-k);
    end  
end
function sancispli1
x=[-2.9405,-2.6003,-2.2462,-1.4674,-0.8610,0.0101,0.3605,0.5078,1.0798,1.3923,1.7162,2.9099];
y=[-1.2430,-1.2037,-1.1519,-0.9726,-0.7108, 0.0101,0.3460,0.4698,0.8237,0.9479,1.0432,1.2398];
ds1=0.1037;dsn=0.1056;
t=[-2.9405,-2.2905,-1.6404,-1.5,-0.9904,-0.3403,0.3097,0.9598,1.6098,2.2599,2.9099];
dl=50;%��ͼ����
plot(x,y,'or');
axis equal;
hold on
[St,Std1,Std2]=qiuzhi1(t,x,y,ds1,dsn);
plot(t,St,'*k')
huatu1(x,y,ds1,dsn,dl);
legend('Original Data','Specified Data','Spline Curve',2)
% hold off;
M=Mjisuan1(x,y,ds1,dsn);
disp(['��׷�Ϸ���õ������Ϊ:']);
for i=1:length(x)
disp(['M',num2str(i-1),'=',num2str(M(i))]);
end
disp(['Ҫ�����',num2str(length(t)),'���ڵ㴦��ֵΪ:'])
for i=1:length(t)
    disp(['S(',num2str(t(i)),')=',num2str(St(i))]);
end
disp(['Ҫ�����',num2str(length(t)),'���ڵ㴦��һ�׵���ֵΪ:'])
for i=1:length(t)
    disp(['dS(',num2str(t(i)),')=',num2str(Std1(i))]);
end
disp(['Ҫ�����',num2str(length(t)),'���ڵ㴦�Ķ��׵���ֵΪ:'])
for i=1:length(t)
    disp(['d2S(',num2str(t(i)),')=',num2str(Std2(i))]);
end%��������
function [St,Std1,Std2]=qiuzhi1(t,x,y,ds1,dsn)
M=Mjisuan1(x,y,ds1,dsn);
LN=length(t);
L=length(x);
jk=1;
for i=1:LN
    for j=jk:L-1
        if  (t(i)-x(j))*(t(i)-x(j+1))<=0
            St(i)=ytjs(x(j),x(j+1),y(j),y(j+1),M(j),M(j+1),t(i));
            Std1(i)=ytjsd1(x(j),x(j+1),y(j),y(j+1),M(j),M(j+1),t(i));
            Std2(i)=ytjsd2(x(j),x(j+1),M(j),M(j+1),t(i));
            break;
        else 
            jk=jk+1;
        end
    end
end
function huatu1(x,y,ds1,dsn,dl)
M=Mjisuan1(x,y,ds1,dsn);
L=length(x);
for i=1:1:L-1
    t=linspace(x(i),x(i+1),dl);
    s=ytjs(x(i),x(i+1),y(i),y(i+1),M(i),M(i+1),t);
    plot(t,s);
    hold on
end;
function M=Mjisuan1(x,y,ds1,dsn)
L=length(x);
M=zeros(L,1);
d=zeros(L,1);
d(1)=6*((y(2)-y(1))/(x(2)-x(1))-ds1)/(x(2)-x(1));
d(L)=6*(dsn-(y(L)-y(L-1))/(x(L)-x(L-1)))/(x(L)-x(L-1));
lamd(1)=1;
mu(L-1)=1;
for i=2:1:L-1
   lamd(i)=(x(i+1)-x(i))/(x(i+1)-x(i-1));
   mu(i-1)=1-lamd(i);
end;
yc1=diff(y)./diff(x);
d([2:end-1])=6*diff(yc1)./(diff(x([1:end-1]))+diff(x([2:end])));
b=2*ones(L,1);
M=zhunganf(mu,b,lamd,d);
function x=zhunganf(a,b,c,f)
n=length(b);
alf(1)=b(1);
for i=2:n
    bita(i-1)=c(i-1)/alf(i-1);
    alf(i)=b(i)-a(i-1)*bita(i-1);
end
y(1)=f(1)/alf(1);
for i=2:n
    y(i)=(f(i)-a(i-1)*y(i-1))/alf(i);%׷�Ĺ���
end
x(n)=y(n);
for i=n-1:-1:1
    x(i)=y(i)-bita(i)*x(i+1);%�ϵĹ���
end
function s=ytjs(x1,x2,y1,y2,M1,M2,t)
h=x2-x1;
s=M1*(x2-t).^3/(6*h)+M2*(t-x1).^3/(6*h)+(y1-M1*h^2/6)*(x2-t)/h+...
    (y2-M2*h^2/6)*(t-x1)/h;
function ds=ytjsd1(x1,x2,y1,y2,M1,M2,t)
h=x2-x1;
ds=-M1*(x2-t).^2/(2*h)+M2*(t-x1).^2/(2*h)-(y1-M1*h^2/6)/h+...
    (y2-M2*h^2/6)/h;
function d2s=ytjsd2(x1,x2,M1,M2,t)
h=x2-x1;
d2s=M1*(x2-t)/h+M2*(t-x1)/h;

