function fixed_point()
syms x
eqn = input('enter the function: ');
phi_x = input('enter the function phi(x): ');
xk = input('enter the starting guess: ');
e = input('maximum tolarence error in %: ');
max_it = input('maximum number of iteration: ');

err = zeros(1,max_it);

for k= 1:1:max_it
    if subs(eqn,xk)==0
        break;
    else
        xk1 = subs(phi_x,xk);
    end
    err(k) = (abs(xk1-xk)/xk1)*100;
    if((abs(xk1-xk)/xk1)*100 <e)
        break;
    end
    if(k == max_it)
        break;
    end
    xk = xk1;
end
fprintf('The root is: %f ',xk1);
x = -5:0.01:5;
y = subs(eqn,x);
plot (x,y) , grid on , xlabel('x') , ylabel('f(x)') , title('f(x) vs x')

figure
x = 1:1:max_it;
y = err;
plot(x,y) , grid on , xlabel('number of iteration') , ylabel('relative error') , title('relative error graph ')
end

