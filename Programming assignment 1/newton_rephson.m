function newton_rephson()
syms x
eqn = input('enter the f(x): ');
diff_eqn = input('enter df(x)/dx : ');
xo = input('intial guess : ');
e = input('maximum tolarence error in % : ');
max_it = input('maximum number of iteration ');

err = zeros(1,max_it);
xk = xo;
for k = 1:1:max_it
    xk = xo - subs(eqn,x,xo)/subs(diff_eqn,x,xo);
    err(k) = (abs(xk-xo)/xk)*100;
    if((abs(xk-xo)/xk)*100 < e)
        break;
    end
    xo = xk;
end
fprintf('The root is : %f',xk);

x = -5:0.01:5;
y = subs(eqn,x);
plot(x,y), grid on , xlabel('x') , ylabel('f(x)') , title('f(x) vs x graph ')

figure
x = 1:1:max_it;
y = err;
plot(x,y) , grid on , xlabel('number of iteration') , ylabel('relative error') , title('error graph')
end

