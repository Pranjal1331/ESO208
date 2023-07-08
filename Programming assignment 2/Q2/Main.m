method = menu("Choose method for finding eigenvalues of a matrix", "Power Method", "Inverse Power Method", "Inverse Power Method with shift", "QR Method");
if(method==1)
    Power_Method
elseif(method==2)
    Inverse_Power_Method
elseif(method==3)
    Inverse_Power_Method_withshift
elseif(method==4)
    QR_Method
else
    disp("Error");
end