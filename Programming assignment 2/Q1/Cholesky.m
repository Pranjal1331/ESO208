function Cholesky()
fileid = fopen('input.txt','r');
format = '%f';
array = fscanf(fileid,format);
N = array(1);
k=2;
A= zeros(N,N+1);
for i = 1:N
     for j= 1:N+1
        A(i,j)=array(k);
        k=k+1;
     end
end
B=A(:,N+1);
A=A(1:N,1:N);
L=zeros(N,N);
U=zeros(N,N);
L(1,1)=sqrt(A(1,1));
U(1,1)=L(1,1);
for a=2:N
    L(a,1)=A(a,1)/L(1,1);
    U(1,a)=A(1,a)/L(1,1);
end
for i=2:N
    for j=i:N
        if i==j
           L(j,i)=sqrt(A(j,i)-L(j,1:i-1)*U(1:i-1,i));
           U(j,i)=L(j,i);
        else
           L(j,i)=(A(j,i)-L(j,1:i-1)*U(1:i-1,i))/L(i,i);
        end
    end
   for k=i+1:N
        U(i,k)=(A(i,k)-L(i,1:i-1)*U(1:i-1,k))/L(i,i);
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
disp('Roots calculated through LU Decomposition_Cholesky Method')
fileid=fopen('output.txt','w');
fprintf(fileid,'CHOLESKY METHOD \nX\n');
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
