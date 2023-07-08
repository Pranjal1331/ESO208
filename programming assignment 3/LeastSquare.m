function LeastSquare()
file_id=fopen("Input.txt",'r');
format = '%f';
filedata = fscanf(file_id,format);
n=filedata(1);
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
f1=fopen('LeastSquareOutput.txt','wt');
m=input('Enter the Order of the Polynomial : ');
m=m+1;
    b=zeros(m,1);
    for k=1:m
        sum=0;
        for i=1:n
            sum=sum+(x(i)^(k-1))*y(i);
        end
        b(k)=sum;
    end
    A=zeros(m);
    for i=1:m
        for j=1:m
            sum=0;
            for k=1:n
                sum=sum+x(k)^(i+j-2);
            end
            A(i,j)=sum;
        end
    end
    coeff=(A\b);
    ax=zeros(m,1);
    for i=1:length(ax)
        ax(i)=coeff(length(coeff)-i+1);
    end
    f=vpa(poly2sym((ax)),3);
    scatter(x,y,'filled','blue');
    hold on;
    fplot(f);    
    xlim([0 1]);
    ylim([-5 25]); 
    uy=0;
    st2=0;
    e=0;
    for i=1:n
        uy=uy+y(i);
    end
    uy=uy/(n+1);
    for i=1:n
        st2=st2+(y(i)-uy)^2;
        e=e+(y(i)-subs(f,x(i)))^2;
    end
    reg=((st2-e)/st2);
fprintf(f1,'Approximated coefficients are: \n\n');
fprintf(f1,"%.3f  ",coeffs(f));
fprintf(f1,'\n\nCoeffecient of determination : \n\n');
fprintf(f1,'%.3f',reg);
xlabel('x');
ylabel('y');


    
    