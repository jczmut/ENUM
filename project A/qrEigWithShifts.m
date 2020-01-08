function [eigenvalues, numberOfIterations, shift, convergenceRatio] = qrEigWithShifts(A)
% calculates eigenvalues of matrix A using the QR method with shifts

% transforming A into a Hessenberg form
A = hess(A);

% at the end, all off-diagonal elements will be below this treshhold
treshold = 10e-6;

% maximal number of iterations
imax = 100;
disp("Default maximum number of iterations is 100.")
disp("Would you like to change it?")
answer = input("y/n", 's');
if strcmp(answer, 'y')
    disp("How many iterations would you like to run?")
    imax = input("Enter this number: ");
end

n = size(A, 1);

% preallocating the place for eigenvalues
eigenvalues = diag(ones(n));
InitialA = A;

for k=n:-1:2
   DK = InitialA;   % initial matrix to calculate a single eigenvalue
   i = 0;
   while i <= imax & max(abs(DK(k,1:k-1))) > treshold
       
       DD = DK(k-1:k,k-1:k);     % 2x2 bottom right corner submatrix
       [ev1, ev2] = quadpolynroots(1, -(DD(1,1)+DD(2,2)), DD(2,2)*DD(1,1)-DD(2,1)*DD(1,2));
       if abs(ev1 - DD(2,2)) < abs(ev2 - DD(2,2))
           shift = ev1;     % shift - DD eigenvalue closest to DK(k,k)
       else
           shift = ev2;
       end
       DP = DK - eye(k)*shift;    % shifted matrix
       [Q1,R1] = qrmgs(DP);     % QR factorization
       DK = R1*Q1 + eye(k)*shift;   % transformed matrix
       i = i+1;
   end
   
   eigenvalues(k) = DK(k,k);
   convergenceRatio = abs((eigenvalues(k) - shift) / (eigenvalues(k-1) - shift));
   
   if k > 2
       InitialA = DK(1:k-1, 1:k-1);    % matrix deflation
   else
       eigenvalues(1) = DK(1,1);    % last eigenvalue
   end
   
end
eigenvalues = sort(eigenvalues);
numberOfIterations = i;

end

