% Creating the 1 - D grid
a = 0;b = 1;n = 7;
h = (b - a)/(n - 1); % Grid - size
x = 0:h:1; % Location of grid points
u = zeros(n,1);u1 = zeros(n,1);
u(n) = 0; u1(n) = 0; 
K = toeplitz([2 -1 zeros(1,n - 3)]);
K1 = toeplitz([2 -1 zeros(1,n - 3)]);
T = K;T(1,1) = 1;
T1 = K1;
T1(1,:) = [-3 4 -1 zeros(1,n - 4)];
f = [0;ones(n-2,1)];
f1 = [0;ones(n-2,1)];
u (1:n-1)= T\(h^2*f);
u1 (1:n-1)= T1\(h^2*f1);
% u1(1) = (-u1(3) + 4*u1(2))/3; 
plot(x,u,'-or',x,u1,'--*g')
hold on
% Comparison with the exact solution
X = 0:0.01:1;
Y =  0.5*(-X.^2 + 1);
plot(X,Y,'--')


