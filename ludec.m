function [L, U] = ludec(A)
% LU decomposition of Matrix A using Dolittle's Algorithm
n = size(A,1);
U = zeros(n, n); L = zeros(n, n);

    for i = 1:n
        L(i,i) = 1;
    end

for i = 1:n
    for j = i:n
        sum = 0;
        
        for k = 1:i-1
            sum = sum + L(i,k)*U(k,j);
        end
        U(i,j) = A(i,j)-sum;
        
        if i < j
           
        sum = 0;
        for k = 1:i-1
            sum = sum + L(j,k)*U(k,i);
        end
        L(j,i) = (A(j,i)-sum)/U(i,i);
        end

     end  
end
    
    