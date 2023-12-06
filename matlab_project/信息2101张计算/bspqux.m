function bspqux
k=3;M=100;%次数及描点数
u=[4 4 4 4 5 7 8 9 9 9 9];
bx=[-2.11 1.31 5.52 6.71 8.11 2 0];
by=[4.32 4.63 5.55 4.65 4.37 2 3];
w=[1 1 1 1 5 6 1];
t=linspace(u(k+1),u(length(u)-k),M);
plot(bx,by,'-ok','LineWidth',2);
hold on;
bx=bx.*w;by=by.*w;
n=100;;
yT=bytj(u,k,t);
rD=[bx;by]*yT./([w*yT;w*yT]);
plot(rD(1,:),rD(2,:),'b','LineWidth',2);
function y=bytj(u,k,t)
%u为节点;k为次数;%t为参数点
m=length(u);
n=length(t);
N=zeros(k+1,n,m-1);
z=zeros(n,m-1);
for i=1:1:m-1
    for j=1:n
       if (t(j)-u(i))>=0 & (t(j)-u(i+1))<0 
         N(1,j,i)=1;
       end       
    end
end
if union(u([m-k:m]),t(n))==t(n)
   N(1,n,m-k-1)=1;
end
for j=2:1:k+1
for i=1:1:m-j
    delt1=u(i+j-1)-u(i);
    delt2=u(i+j)-u(i+1);
    feizi1=(t-u(i)).*N(j-1,1:n,i);
    feizi2=(u(i+j)-t).*N(j-1,1:n,i+1);
    if delt1==0 & delt2==0
       N(j,1:n,i)=0;
    end
    if delt1==0 & delt2~=0
       N(j,1:n,i)=feizi2/delt2;
    end
    if delt2==0 & delt1~=0 
       N(j,1:n,i)=feizi1/delt1;
    end
    if delt1~=0 & delt2~=0
       N(j,1:n,i)=feizi1/delt1+feizi2/delt2;
    end
end
end
y=zeros(m-k-1,n);
for i=1:1:m-k-1
    y(i,:)=N(k+1,1:n,i);
end