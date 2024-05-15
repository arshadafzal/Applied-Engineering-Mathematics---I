function x = thomasalg(A,b)
% THOMAS ALGORITHM 
% x = thomasalg(A,b) attempts to solve the system A*x = B with the 
% THOMAS ALGORITHM (Tri-diagonal system)

% Author: Arshad Afzal, Assistant Professor, GIST, South Korea
% For Education purpose only


[~, n] = size(A);
x = zeros(n,1);
l = zeros(n,1);
u = zeros(n,1);

for i = 2:n
    j = i-1;
        l(i) = A(i,j);
end

for i = 1:n-1
    j = i+1;
        u(i) = A(i,j);
end

d = diag(A);

alpha = zeros(n,1); alpha(1) = d(1);
beta = zeros(n,1); beta(1) = b(1);

%==========================================================================

for i = 2:n
    alpha(i) = d(i) - (l(i)/alpha(i-1))*u(i-1);
    beta(i) = b(i) - (l(i)/alpha(i-1))*beta(i-1);
end

x(n) = beta(n)/alpha(n);

for j = n-1:-1:1
    x(j) = (beta(j) - u(j)*x(j+1))/alpha(j);
end

end
    
    