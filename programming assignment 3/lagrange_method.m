function lagrange_method()
file_id = fopen("input_Q1.txt",'r');
format = '%f';
filedata = fscanf(file_id,format);

n = filedata(1);
data=filedata(2:end);
x=zeros(n,1);
y=zeros(n,1);
c1=1;
c2=1;
for i=1:2*n     
    if(mod(i,2)==0)
        y(c1)=data(i);
        c1=c1+1;
    else
        x(c2)=data(i);
        c2=c2+1;
    end
end
n2 = data(2*n+1);
x0 = zeros(n2);
p = 2*n+2;
for i=1:1:n2
    x0(i) = data(p);
    p = p+1;
end
L = zeros(n,n);
for i=1:n
    phi = 1;
    for j=1:n
        if (i~=j)
        phi = conv(phi,poly(x(j)))/(x(i)-x(j));
        end
    end
    L(i,:) = phi*y(i);
end
polynomial = sum(L);
file = fopen("output_Q1.txt",'wt');
for k = 1:n2
    A = polyval(polynomial,x0(k));
    fprintf(file,"%0.3f %.4f\n",x0(k),A);
end
scatter(x,y,'filled','blue');
hold on
x = -1:0.01:1;
y = polyval(polynomial,x);
plot(x,y) , grid on 
