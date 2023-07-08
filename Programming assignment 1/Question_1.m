%% Solution for question 1 
method = menu('select the method','bisection','false_position','fixed_point','newton_rephson','secant' );

if method == 1
    bisection();
elseif(method ==2)
    false_position();
elseif method ==3
    fixed_point();
elseif method == 4
    newton_rephson();
elseif method == 5
    secant();
end
