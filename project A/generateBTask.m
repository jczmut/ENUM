function [A, b] = generateBTask(size)
% generates the matrix A and vector b for task B

format short;

% filling up the matrix A and the vector b with zeros to then overwrite it
A = zeros(size, size);
b = zeros(size, 1);

% putting the values into the matrix A
for i = 1:size
    for j = 1:size
        A(i, j) = 1/[4*(i + j + 1)];
    end
end

% putting the values into the vector b
for i = 1:size
    if(mod(i,2) == 0)
        b(i) = 7/(6*i);
    end
end
end

