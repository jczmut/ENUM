function [conditionNumber] = conditionNumber(A)
% returns the condition number of matrix A

    conditionNumber = norm(inv(A))*norm(A);

end

