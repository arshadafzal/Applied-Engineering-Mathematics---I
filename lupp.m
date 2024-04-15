function [P,L, U] = lupp(A)
% LU decomposition of Matrix A using Gaussian Elimination
% AND Partial pivoting
% For Education purpose only

n = size(A,1);
P = eye(n);

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
end
    
    