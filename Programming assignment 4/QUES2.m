syms y
syms t
syms x
fileid=fopen("input2.txt",'r');
formatSpec= '%f';
formatSpec1= '%f\n';
formatspec2='%s\n';
sizef = [1,1];
f = fscanf(fileid,formatspec2,sizef);
f=str2sym(f);
sizei=[1,2];
ivp = fscanf(fileid,formatSpec1,sizei);
sizefn=[1,1];
fin=fscanf(fileid,formatSpec1,sizefn);
sizeh=[1,1];
h = fscanf(fileid,formatSpec1,sizeh);
sizec=[1,1];
ch=menu("select the method:",'euler forwarded mathod','RK second order','RK 4th order');
if ch==1
    fileID = fopen('output_euler.txt','w');
    n=(fin-ivp(1))/h;
    yo=ivp(2);
    to=ivp(1);
    for i=1:n+1
        yn= yo+h*subs(f,[t y],[to yo]);
        yn=round(yn,8);
   
        sol=[to,yo];
        hold on
        plot(to,yo,"o")
        grid on
        xlabel("t")
        ylabel("y")
        title("euler forward")
        fprintf(fileID,"%f %f\n",sol');
        fprintf("%f %f\n",sol)
        to=to+h;
        yo=yn;
    end
elseif ch==2
    fileID = fopen('output_RK2.txt','w');
    n=(fin-ivp(1))/h;
    yo=ivp(2);
    to=ivp(1);
    for i=1:n+1
        k1=subs(f,[t y],[to,yo]);
        k2=subs(f,[t,y],[to+h/2 yo+k1*h/2]);
        slope=0.5*(k1+k2);
        yn=yo+h*slope;
        yn=round(yn,8);
        sol=[to,yo];
        hold on
        plot(to,yo,"o")
        grid on
        xlabel("t")
        ylabel("y")
        title("2 R.K")
        fprintf("%f %f\n",sol)
        fprintf(fileID,"%f %f\n",sol');
        to=to+h;
        yo=yn;
    end
else 
    fileID = fopen('output_RK4.txt','w');
    n=(fin-ivp(1))/h;
    yo=ivp(2);
    to=ivp(1);
    for i=1:n+1
        k1=subs(f,[t y],[to,yo]);
        k2=subs(f,[t,y],[to+h/2 yo+k1*h/2]);
        k3=subs(f,[t,y],[to+h/2 yo+k2*h/2]);
        k4=subs(f,[t,y],[to+h yo+k3*h]);
        slope=(k1+2*k2+2*k3+k4)/6;
        yn=yo+h*slope;
        yn=round(yn,8);
        sol=[to,yo];
        hold on
        plot(to,yo,"o")
        grid on
        xlabel("t")
        ylabel("y")
        title("4 R.K")
        fprintf("%f %f\n",sol)
        fprintf(fileID,"%f %f\n",sol');
        to=to+h;
        yo=yn;
    end
end
    


