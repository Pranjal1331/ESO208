syms x
fileid=fopen("input_Q1.txt",'r');
formatSpec= '%f';
formatSpec1= '%f\n';
sizen = [1,1];
n = fscanf(fileid,formatSpec1,sizen);
sizea=[2,n];
a=fscanf(fileid,formatSpec,sizea);
a=a';
x1=a(:,1);
f1=a(:,2);
sizem=[1,1];
m = fscanf(fileid,formatSpec1,sizem);
sizex0= [m,1];
x0=fscanf(fileid,formatSpec1,sizex0);

u=zeros(1,n-1);
d=zeros(1,n-2);
l=[];
U=[];
b=[];
for i=2:n-1
    y1=(f1(i+1)-f1(i))/(x1(i+1)-x1(i));
    y2=(f1(i)-f1(i-1))/(x1(i)-x1(i-1));
    c=3*y1-3*y2;
    b=[b,c];
end
b;
for i=2:n-2
    h=x1(i+1)-x1(i);
    l=[l,h];
end
U=l;
for i=1:n-2
    d(i)=2*(x1(i+2)-x1(i));
end

U=[U,0];
l=[0,l];
d;
b;


r=zeros(1,n-2);
s=zeros(1,n-2);
sol=zeros(1,n-2);
r(1)=d(1);
s(1)=b(1);
for i=2:n-2
    r(i)=d(i)-(l(i)/r(i-1))*U(i-1);
    s(i)=b(i)-(l(i)/r(i-1))*s(i-1);
end

sol(n-2)=s(n-2)/r(n-2);
for i=n-3:-1:1
    sol(i)=(s(i)-U(i)*sol(i+1))/r(i);
end
sol;
v=[0,sol,0];
for i=1:n-1
    y1=(f1(i+1)-f1(i))/(x1(i+1)-x1(i));
    hi=x1(i+1)-x1(i);
    w=v(i+1)+2*v(i);
    u(i)=y1-hi*w/3;
end
u;
for g=1:n-1
    c3=(v(g+1)-v(g))/(3*(x1(g+1)-x1(g)));
    f=f1(g)+u(g)*(x-x1(g))+v(g)*(x-x1(g))^2+c3*(x-x1(g))^3;
    fplot(f,[x1(g) x1(g+1)])
    hold on
    y=subs(f,x1(g));
    plot(x1(g),y,"o")
    
end


sol1=zeros(1,m);
for i=1:m
    for j=1:n-1
        if x0(i)>x1(j) && x0(i)<x1(j+1)
            c3=(v(j+1)-v(j))/(3*(x1(j+1)-x1(j)));
            f=f1(j)+u(j)*(x-x1(j))+v(j)*(x-x1(j))^2+c3*(x-x1(j))^3;
            sol1(i)=subs(f,x0(i));
            break
        end
    end
end
sol1;
sol1=sol1';

solf=[x0,sol1]
fileID = fopen('output_spline.txt','w');
fprintf(fileID,'%s',"");
fileID = fopen('output_spline.txt','a');
fprintf(fileID,'%s',"The interpolated points and its values are: ");
writematrix(solf,'output_spline.txt','WriteMode','append')




