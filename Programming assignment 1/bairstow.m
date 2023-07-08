function bairstow()
func = input('Enter the polynomial f(x): ','s');
    f = str2sym(func);
    alpha0 = input('Enter starting value of alpha0: ');
    alpha1 = input('Enter starting value of alpha1: ');
    e = input('Enter the maximum relative approximate error allowed(in %): ');
    max_it = input('Enter the maximum number of iterations allowed: ');
    n = polynomialDegree(f) + 1;
    m = n - 1;
    a = sym2poly(f);
    a = fliplr(a);
    M = zeros; 
    N = zeros;
    while n > 0
        for j = 1: max_it
            b = zeros;
            c = zeros;
            b(n) = a(n);
            b(n-1) = a(n-1) + alpha1*b(n);
            c(n) = b(n);
            c(n-1) = b(n-1) + alpha1*c(n);
            
            for i = n-2: -1: 1
                b(i) = a(i) + alpha1*b(i+1) + alpha0*b(i+2);
                c(i) = b(i) + alpha1*c(i+1) + alpha0*c(i+2);
            end
            
            syms x y
            eqn1 = c(2)*x + c(3)*y == -b(1);
            eqn2 = c(3)*x + c(4)*y == -b(2);
            sol = solve([eqn1, eqn2], [x, y]);
            del_alpha1 = sol.x;
            del_alpha0 = sol.y;
            err_alpha1 = abs((del_alpha1/(alpha1+del_alpha1))*100);
            err_alpha0 = abs((del_alpha0/(alpha0+del_alpha0))*100);
            N(j) = err_alpha0;
            M(j) = err_alpha1;
            if err_alpha0 > e || err_alpha1 > e
                alpha1 = alpha1 + del_alpha1;
                alpha0 = alpha0 + del_alpha0;
            end
            if err_alpha0 < e && err_alpha1 < e
                alpha1 = alpha1 + del_alpha1;
                alpha0 = alpha0 + del_alpha0;
                break;
            end
        end
        m = m - 2;
        if (alpha1^2 + 4*alpha0) < 0
            x1 = alpha1/2;
            x2 = (-(alpha1^2 + 4*alpha0))/2;
            fprintf('Roots of the function are: %f + %fi, %f - %fi\n', x1, x2, x1, x2);
        else
            x1 = (alpha1 + (alpha1^2 + 4*alpha0)^(1/2))/2;
            x2 = (alpha1 - (alpha1^2 + 4*alpha0)^(1/2))/2;
            fprintf('Roots of the function are: %f, %f\n', x1, x2);
        end
        if m > 2
            a = ones;
            for k = n : -1: 3
                a(k-2) = b(k);
            end
        end
        n = n - 2;
        if m == 2
            if (b(4)^2 - 4*b(5)*b(3)) < 0
                x3 = -b(4)/2*b(5);
                x4 = (-(b(4)^2 - 4*b(5)*b(3)))^(1/2)/2*b(5);
                fprintf('Roots of the function are: %f + %fi, %f - %fi\n', x3, x4, x3, x4);
            else
                x3 = (-b(4) + (b(4)^2 - 4*b(5)*b(3))^(1/2))/2*b(5);
                x4 = (-b(4) - (b(4)^2 - 4*b(5)*b(3))^(1/2))/2*b(5);
                fprintf('Roots of the function are: %f, %f\n', x3, x4);
            end
            break;
        end
        if m == 1
            x1 = -b(3)/b(4);
            fprintf('Roots of the function are: %f\n', x1);
            break;
        end
    end
    figure(1);
    fplot(f) 
    grid on
    xlabel('x') 
    ylabel('f(x)')
    title('F(X) vs X graph')
end