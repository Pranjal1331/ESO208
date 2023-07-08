function muller()
func=input("Enter your Function: ");
x0=input("enter the first starting point: ");
x1=input("enter the second starting point: ");
x2=input("enter the third starting point: ");
e=input("enter the maximum tolarence in % : ");
max_it=input("enter maximum number of iteration : ");

for i=1:max_it
    l=(func(x2)-func(x1))/(x2-x1);
    m=(func(x1)-func(x0))/(x1-x0);

    a=(l-m)/(x2-x0);
    b=l+a*(x2-x1);
    c=func(x2);
    Dis=sqrt((b^2)-(4*a*c));
    if abs(b+Dis)>abs(b-Dis)
        dr = b+Dis ;
    else
        dr=b-Dis ;
    end
    
    x3=x2-((2*c)/dr);
    if (abs((x3-x2)/x3))*100<e
        break
    end
    
    x0=x1;
    x1=x2;
    x2=x3;
   
end
fprintf("The roots is : %f", x2)

p=-5:0.01:5;
q=subs(func,p);
plot(p,q),grid on, xlabel('X'),ylabel('Func(X)'),title("Func(X) vs X Graph")
