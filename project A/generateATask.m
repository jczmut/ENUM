function [A, b] = generateATask(size)
% generating the matrix A and vector b for task A

format short

% filling up the matrix A and vector b with zeros to then overwrite it
A = zeros(size, size);
b = zeros(size, 1);

% putting the values into the matrix A
for i = 1:size
    for j = 1:size
        if(i == j)
            A(i, j) = 6;
        end
        if(i == j-1 || i == j+1)
            A(i, j) = -1;
        end
    end
end

% putting the values into the vector b
for i = 1:size
    b(i) = -2 + 0.3*i;
end
end