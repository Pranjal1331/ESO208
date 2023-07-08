function bisection()
syms x
eqn = input('enter the function : ');
xl = input('enter the lower bound: ');
xu = input('enter the upper bound : ');
max_itt = input('enter the maximum number of intration: ');
e = input('enter the maximum tolarence error: ');

xr = 0;
err = zeros(1,max_itt);
for k = 1:max_itt
    if (subs(eqn,xl)*subs(eqn,xu)<0)
        xr = (xl+xu)/2;
        if subs(eqn,xr)==0
            break;
        elseif subs(eqn,xr)*subs(eqn,xl)<0
            xu = xr;
        else
            xl = xr;
        end
        err(k) = (abs(xu-xl)/xu)*100;
        if((abs(xu-xl)/xu)*100 < e)
            break;
        end
        if(k==max_itt)
            break;
        end    
    end    
end    
fprintf('Root is = %f',xr);

x = -5:0.01:5;
y = subs(eqn,x);
plot (x,y) , grid on , xlabel('x') , ylabel('f(x)') , title('f(x) vs x') 

figure
x = 1:1:max_itt;
y= err;
plot(x,y) , grid on , xlabel('iteration number') , ylabel('relative error') , title('error graph')
end
