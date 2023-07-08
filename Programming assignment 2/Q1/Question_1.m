method =menu('Select a method:', 'Gauss Elimination_Without Pivoting', 'Gauss Elimination_With Pivoting','LU Decomposition_Dolittle Method_Without Pivoting','LU Decomposition_Crout Method_Without Pivoting','LU Decomposition_Cholesky Method_Without Pivoting');
if method==1
    clc;
    GE_Without_Pivoting();
end
if method==2
    clc;
    GE_With_Pivoting();
end
if method==3
    clc;
    LU_Dolittle();
end
if method==4
    clc;
    LU_Crout();
end
if method==5
    clc;
    Cholesky();
end
