function Main()
pop1=menu('choose a method','A.Lagrange Interpolation Polynomial','B.normal Cubic splines');
if(pop1==1)
    lagrange_method();
end
if(pop1==2)
    natural_spline();
end


    