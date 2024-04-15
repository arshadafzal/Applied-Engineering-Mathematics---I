function [L, U] = ludecge(A)
% LU decomposition of Matrix A using Gaussian Elimination
% Requirement: Gaussian Elimination with ONLY Type III Operations
% For Education purpose only

n = size(A,1);


for k = 1:n-1
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
end
    
    