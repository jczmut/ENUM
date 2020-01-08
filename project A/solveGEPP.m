function [solutions, residuumNorm, correctedResiduumNorm] = solveGEPP(A, b)
% checking if conditions are met, creating an augmented matrix
% and solving the system of linear equations using Gaussian elimination
% with partial pivoting

% CHECKING CONDITIONS:

% is the matrix square?
sizeA = size(A);
if(sizeA(1) ~= sizeA(2))
    error("This matrix is not square")
end

% does the vector have proper dimension?
sizeB = size(b);
if(sizeB(2) ~= 1)
    error("This vector have more than one column")
end

% do the matrix and the vector have the same number of rows?
if(sizeA(1) ~= sizeB(1))
    error("Matrix and vector cannot be augmented")
end

clear sizeA;   % we do not need those variables anymore
clear sizeB;

% creating an augmented matrix out of A and b
M = [A, b];

n = size(A, 1);

% PARTIAL PIVOTING

for k = 1:n
    i = k;
    for j = i+1:n
        if(M(j, i) > M(i, j))
            i = j;
        end
    end
    
    if(k ~= i)
        M([k i], :) = M([i k], :);
    end

    % modifying to obtain row echelon form
    for j = k+1:n
        multiple = M(j, k) / M(k, k);
        M(j, :) = M(j, :) - M(k, :)*multiple;
    end
end

% BACK SUBSTITUTION

% creating empty vector to then fill with answers
solutions = zeros(1, n);

% separating the augmented matrix 
NewA = M(:, 1:end-1);
Newb = M(:, end);

% filling up the solutionVector
for k = 1:n
    k = n - k +1;
    sum = 0;
    for j = k+1:n
        sum = sum + (M(k, j) * solutions(j));
    end
    solutions(k) = (Newb(k) - sum) / NewA(k, k); 
end

solutions = solutions';   

% ERRORS CALCULATION

% calculating the residuum
residuum = A * solutions - b;

% calculating the Euclidean norm of residuum
norm = 0;
for k = 1:size(residuum)
    norm = norm + (residuum(k) * residuum(k));
end

residuumNorm = sqrt(norm);

% RESIDUAL CORRECTION (ITERATIVE IMPROVEMENT)

deltaX = residuum'/A;
deltaX = deltaX';
correctedX = solutions - deltaX;
correctedResiduum = A * correctedX - b;

% calculating the Euclidean norm of the corrected residuum
correctedNorm = 0;
for k = 1:size(correctedResiduum)
    correctedNorm = correctedNorm + (correctedResiduum(k) * correctedResiduum(k));
end

correctedResiduumNorm = sqrt(correctedNorm); 

end

