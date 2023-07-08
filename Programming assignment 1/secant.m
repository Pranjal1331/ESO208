function secant()
syms x
eqn = input('enter the function :');
xo = input('first staring value xo : ');
x1 = input('second starting value x1: ');
e = input('maximum tolarence error: ');
max_it = input('maximum number of iteration :');

err = zeros(1,max_it);
xk_1=xo;
xk = x1;
xk1 =0;
for k = 1:1:max_it
    diff_eqn = (subs(eqn,x,xk) - subs(eqn,x,xk_1))/(xk-xk_1);
    xk1 = xk - subs(eqn,x,xk)/diff_eqn;
    if(subs(eqn,xk1)==0) 
        break;
    end
    err(k) = (abs(xk1-xk)/xk1)*100;
    if (abs(xk1-xk)/xk1)*100 <e
        break;
    end
    if(k==max_it)
        break;
    end
    xk_1 = xk;
    xk  = xk1;
end
fprintf('The root is %f',xk1);

x = -5:0.01:5;
y = subs(eqn,x);
plot(x,y) , grid on , xlabel('x') , ylabel('f(x)') , title('f(x) vs x graph')

figure
x = 1:1:max_it;
y = err;
plot(x,y) , grid on , xlabel('number of iteration') , ylabel('relative % error') , title('error graph')
end


   