function [L, U, x] = lusolve(A,b)
% LU decomposition of Matrix A using Dolittle's Algorithm
% [L, U, x] = lusolve(A,b) attempts to solve the system A*x = B with the 
% LU Factorization, forward and backward substitution.

% Author: Arshad Afzal, Assistant Professor, GIST, South Korea
% For Education purpose only

n = size(A,1);

% Initialization
U = zeros(n,n); L = zeros(n,n);
x = zeros(n,1); y = zeros(n,1);
% Dolittle's Algorithm

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

% Forward Substitution

y(1) = b(1);
for i = 2:n
    sum = 0;
    for j =1:i-1
        sum = sum + L(i,j)*y(j);
    end
    y(i)=  (b(i) - sum)/L(i,i);
end

% Backward substitution

x(n) = y(n)/U(n,n);
for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + U(i,j)*x(j);
    end
        x(i) = (y(i)- sum)/U(i,i);
end
end
    
    