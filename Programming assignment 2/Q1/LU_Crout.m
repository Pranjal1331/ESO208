function LU_Crout()

fileid = fopen('input.txt','r');
format = '%f';
array = fscanf(fileid,format);
N = array(1);
k=2;
aug_matrix= zeros(N,N+1);
for i = 1:N
    for j= 1:N+1
       aug_matrix(i,j)=array(k);
       k=k+1;
    end
end
B=aug_matrix(:,N+1);
aug_matrix=aug_matrix(1:N,1:N);
L=zeros(N,N);
U=zeros(N,N);
for a=1:N
    U(a,a)=1;
end
L(:,1)=aug_matrix(:,1);
U(1,:)=aug_matrix(1,:)/L(1,1);
for i=2:N
    for k=i:N
       L(k,i)=(aug_matrix(k,i)-L(k,1:i-1)*U(1:i-1,i));
    end

    for j=i+1:N
       U(i,j)=(aug_matrix(i,j)-L(i,1:i-1)*U(1:i-1,j))/L(i,i);
    end
end
Y=zeros(N,1);
Y(1)=B(1)/L(1,1);
for k=2:N
    Y(k)=(B(k)-L(k,1:k-1)*Y(1:k-1))/L(k,k);
end
X=zeros(N,1);
X(N)=Y(N)/U(N,N);
for k=N-1:-1:1
    X(k)=(Y(k)-U(k,k+1:N)*X(k+1:N))/U(k,k);
end
disp('Roots calculated through LU Decomposition_Crout Method')
fileid=fopen('output.txt','w');
fprintf(fileid,'CROUT METHOD \nX\n');
for i=1:N
    fprintf(fileid,'%f\n',X(i,1));
end
fprintf(fileid,'L\n');
for i=1:N
    for j=1:N
       fprintf(fileid,'%f ',L(i,j));
    end
    fprintf(fileid,'\n');
end
fprintf(fileid,'U\n');
for i=1:N
    for j=1:N
        fprintf(fileid,'%f ',U(i,j));
    end
    fprintf(fileid,'\n');
end