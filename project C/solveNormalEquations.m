function [a, error, conditionNumber] = solveNormalEquations(G, q)
% performs QR factorization, solves the set of normal equations
% calculates the errors and condition numbers for each solution

% performing QR factorization on the Gram's matrix
[Q, R] = qrmgs(G);

% matrix-vector product
d = Q' * q;

% creating empty vectors for solutions
n = length(q);
a = zeros(n, 1);


% back substitution
for i=n:-1:1
   a(i) =  d(i) / R(i,i);
   d(1:i-1) = d(1:i-1) - R(1:i-1,i)*a(i);
end

flip(a);

% error - Euclidean norm of the vector of residuum 
error = norm(G*a - q);

% condition number of the Gram's matrix
conditionNumber = cond(G);

end

