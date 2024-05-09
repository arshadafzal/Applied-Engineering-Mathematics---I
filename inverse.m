function Ainv = inverse(A)
% Program to find Inverse of a Matrix A using  LU decomposition 
% Method for LU decomposition is Dolittle's Algorithm


[m,n] = size(A);

% Initialization
U = zeros(n,n); L = zeros(n,n);
B = zeros(n,n); Ainv = zeros(n,n);
    

    for i = 1:n
        L(i,i) = 1;
    end

    % Dolittle's Algorithm

    for i = 1:n
        for j = i:n
            sum = 0;

            for k = 1:i-1
                sum = sum + L(i,k)*U(k,j);
            end

                U(i,j) = A(i,j)-sum;
             
             if  i < j

             sum = 0;
             for k = 1:i-1
                sum = sum + L(j,k)*U(k,i);
             end
                L(j,i) = (A(j,i)-sum)/U(i,i);
             end

         end  
    end
    
% Main Program for calculating inverse of matrix

% Forward elimination, solve LB = I

b = eye(n);
for i = 1:m
    B(1,i) = b(1,i)/L(1,1);
    for k = 2:m
        sum = 0;
            for j = k-1:-1:1
              sum = sum + L(k,j)*B(j,i);
            end
        B(k,i) = (b(k,i)- sum)/L(k,k);
    end
end

% Backward substitution, solve U*Ainv = B
for i = 1:m
      Ainv(m,i) = B(m,i)/U(m,m);
      for k = m-1:-1:1
        sum = 0;
        for j = k+1:m
           sum = sum + U(k,j)*Ainv(j,i);
        end
        Ainv(k,i) = (B(k,i)- sum)/U(k,k);
      end
end

end
    
