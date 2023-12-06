function bsplineHm
clear;
u=[0 1 2 3 4 5 6 7 8 9 10];
v=[0 1 2 3 4 5 6 7 7 7 7];
ku=3;kv=3;
Mu=100;Mv=100;
tu=linspace(u(ku+1),u(length(u)-ku),Mu);
tv=linspace(v(kv+1),v(length(v)-kv),Mv);
x=[-1 -1 -3 -3 -1 -1 -3;
    1  1  3  3  1  1  3;
    1  1  3  3  1  1  3;
   -1 -1 -3 -3 -1 -1 -3;
   -1 -1 -3 -3 -1 -1 -3;
    1  1  3  3  1  1  3;
    1  1  3  3  1  1  3];
y=[-1 -1 -3 -3 -1 -1 -3;
   -1 -1 -3 -3 -1 -1 -3;
    1  1  3  3  1  1  3;
    1  1  3  3  1  1  3;
   -1 -1 -3 -3 -1 -1 -3;
   -1 -1 -3 -3 -1 -1 -3;
    1  1  3  3  1  1  3];
z=[0 1 1 0 0 2 3;
   0 1 1 0 0 2 3;
   0 1 1 0 0 2 3;
   0 1 1 0 0 2 3;
   0 1 1 0 0 2 3;
   0 1 1 0 0 2 3;
   0 1 1 0 0 2 3];
Tu=bytj(u,ku,tu);
Tv=bytj(v,kv,tv);
xst=Tu'*x*Tv;
yst=Tu'*y*Tv;
zst=Tu'*z*Tv;
[m n]=size(x);
for i=1:m
    plot3(x(i,:),y(i,:),z(i,:),'-or','LineWidth',2);
    hold on;
end
for i=1:n
    plot3(x(:,i),y(:,i),z(:,i),'-ob','LineWidth',2);
end
grid on
p1=mesh(xst,yst,zst);
set(p1,'FaceColor','r','EdgeColor','b');
xlabel('X-axis');ylabel('Y-axis');zlabel('Z-axis');
hold off;
view([-60 40]);
camlight headlight; lighting phong;
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