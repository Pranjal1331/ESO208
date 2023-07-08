function GE_Without_Pivoting()

    fileid = fopen('input.txt','r');
    format = '%f';
    array = fscanf(fileid,format);
    n = array(1);
    k=2;
    %converting array into matrix
    A= zeros(n,n+1);
    for i = 1:n
        for j= 1:n+1
            A(i,j)=array(k);
            k=k+1;
        end
    end
    X=zeros(n,1);
    for j=1:n-1
        for i=j+1:n
            m=A(i,j)/A(j,j);
            A(i,:)=A(i,:)-m*A(j,:);
        end
    end
    X(n)=A(n,n+1)/A(n,n);
    for k= n-1:-1:1
        X(k)=(A(k,n+1) - A(k, k+1:n)*X(k+1:n))/A(k,k);
    end
    disp('Roots calculated through Gauss Elimination without Pivoting')
    fileid=fopen('output.txt','w');
    fprintf(fileid,'GAUSS ELIMINATION (WITHOUT PIVOTING) \nX\n');
    for i=1:n
    fprintf(fileid,'%f\n',X(i,1));
    end
