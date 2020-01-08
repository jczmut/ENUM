function [A] = generateSymmetric(m)
% generates a symmetric 5x5 matrix

    A = randi(6, m, m) - 1;
    A = A - tril(A, -1) + triu(A, 1)';

end

