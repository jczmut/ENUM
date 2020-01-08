function [solutionVector, errors, iterations] = solveGaussSeidel(A, b)
% checks some conditions and solves the system of linear equations
% using an iterative method - Gauss-Seidel method

% CHECKING CONDITIONS
% is matrix A square?
sizeA = size(A);
if(sizeA(1) ~= sizeA(2))
    error("This matrix is not square")
end

% does the vector have proper dimensions?
sizeb = size(b);
if(sizeb(2) ~= 1)
    error("This vector has more that one column")
end

% do matrix A and vector b have the same number of rows?
if(sizeA(1) ~= sizeb(1))
    error("Matrix and vector do not have proper dimensions")
end

% decomposing the matrix A = L + D + U
sizeA = size(A);
D = diag(diag(A));

L = tril(A);
for i=1:sizeA(1)
    L(i, i) = 0;
end
    
U = triu(A);
for i=1:sizeA(1)
    U(i, i) = 0;
end

% creating matrix M
M = -U/(D+L);

% is sr(A) < 1
sr = max(abs(eig(M)));
disp("sr(M) = " + sr)
if sr >= 1
    error("Convergence condition is not met. Cannot procede.")
end

% is the matrix diagonally dominant?
for i = 1:sizeA(1)
    currentRow = abs(A(i, :));
    allButDiagonal = sum(currentRow) - currentRow(i);
    if currentRow(i) < allButDiagonal
        error("This matrix is not diagonally dominant. Cannot procede with this method.")
    end
end

% getting new number of iterations or staying with the default
imax = 100;
disp("Default maximum number of iterations is 100.")
disp("Would you like to change it?")
answer = input("y/n", 's');
if strcmp(answer, 'y')
    disp("How many iterations would you like to run?")
    imax = input("Enter this number: ");
end

% creating an initial estimate of the solution
% it is the easiest to use zeros
x = zeros(sizeA(1), 1);

D = diag(A);

solutionError = inf;

% tolerance specified in the task is 10^(-10)
lambda = 10e-10;

i = 1;
while solutionError > lambda & i<imax
    
   for k = 1:size(x)
 
      currentx = x;
      
      for j = 1:size(x)
          % setting the coefficients to the vector
          currentx(j) = currentx(j) * A(k,j);
      end
      x(k) = ( b(k) - (sum(currentx) - currentx(k)) ) / D(k);
   end
     
   solutionError = norm(A*x-b);
   errors(i) = solutionError;
   iterations(i) = i;
   i = i + 1;

end

if i >= imax
   disp("Maximal number of iterations reached.") 
end

solutionVector = x;

errors = errors';
iterations = iterations';

end

