function [L, U, x] = lusol(A,b)
% LU decomposition of Matrix A using Gaussian Elimination with partial
% pivoting
% [L, U, x] = lusolve(A,b) attempts to solve the system A*x = B with the 
% LU Factorization, forward and backward substitution.

% Author: Arshad Afzal, GIST, South Korea

n = size(A,1);
P = eye(n);

% Initialization
x = zeros(n,1); y = zeros(n,1);

% Dolittle's Algorithm
for k = 1:n-1
    % Performing partial-pivoting
        for p = k+1:n
            if (abs(A(k,k)) < abs(A(p,k)))
                A([k p],:) = A([p k],:);
                  P([k p],:) = P([p k],:);
            end
        end
    for i = k+1:n
        A(i,k) = A(i,k)/A(k,k);
        for j = k+1:n
            A(i,j) = A(i,j)-A(i,k)*A(k,j);
        end  
    end
end
U = A; L = A;

for i = 1:n
    L(i,i) = 1;
end
    
for k = 1:n
    for i = k+1:n
        L(k,i) = 0;
    end
end

for k = 1:n-1
    for i = k+1:n
        U(i,k) = 0;
    end
end

% Forward Substitution
c = P*b;
y(1) = c(1);
for i = 2:n
    sum = 0;
    for j =1:i-1
        sum = sum + L(i,j)*y(j);
    end
    y(i)=  (c(i) - sum)/L(i,i);
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
    
    
