function false_position() 
    func=input("Enter your Function: ");
    a=input("Enter your Left Side No. of your Initial Guess: ");
    b=input("Enter your Right Side No. of your Initial Guess: ");
    error=input("Enter maximum tolerance error: ");
    num=input("Enter no. of Iterations: ");
    e=zeros(1,num);
    if func(a)*func(b)<0 && a<b
        for i=1:num 
            c=(a*func(b)-b*func(a))/(func(b)-func(a));
            e(i)=(abs(c-a/c))*100;
            if e(i)<error
            break
            end
            if func(a)*func(c)<0
                b=c;
            else 
                a=c;
            end
        end
    end
    fprintf("Approximate Root: %f\n      ",c)
    
    p=-5:0.01:5;
    q=subs(func,p);
    plot(p,q),grid on, xlabel('X'),ylabel('f(X)'),title("f(x) vs x Graph")
    figure
    x=1:1:num;
    y=e;
    plot(x,y),grid on,xlabel('number of iterations'), ylabel('relative error'), title('Error Graph')
 end
