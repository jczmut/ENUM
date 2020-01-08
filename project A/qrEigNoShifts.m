function [eigenvalues, numberOfIterations, convergenceRatio] = qrEigNoShifts(A)
% calculates eigenvalues of matrix A using the QR method without shifts

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

i = 1;
while i <= imax & max(max(A - diag(diag(A)))) > treshold
   [Q1, R1] = qrmgs(A);
   A = R1 * Q1;    % transformed matrix
   i = i+1;
end

if i > imax
   disp("Maximal number of iterations reached.") 
end

numberOfIterations = i;
eigenvalues = diag(A);
eigenvalues = sort(eigenvalues);
convergenceRatio = abs(eigenvalues(n-1)/eigenvalues(n));

end

