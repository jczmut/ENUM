function qrCompare()
% shows results of functions calculating eigenvalues to present
% the differences between implementations with and without shifts
    
    % generating a symmetric 5x5 matrix
    [A] = generateSymmetric(5);
    
    % calculating eigenvalues of A using both methods
    [eigenvaluesWithout, iterationsWithout, convergenceWithout] = qrEigNoShifts(A);
    [eigenvaluesWith, iterationsWith, shift, convergenceWith] = qrEigWithShifts(A);
    
    disp("Eigenvalues calculated with QR method without shifts:")
    disp(eigenvaluesWithout)
    disp("It took " + iterationsWithout + " iterations.")
    disp("The convergence ratio is: " + convergenceWithout)
    disp("Eigenvalues calculated with QR method with shifts:")
    disp(eigenvaluesWith)
    disp("It took " + iterationsWith + " iteration(s).")
    disp("The chosen shift: " + shift)
    disp("The convergence ratio is: " + convergenceWith)
    
    % checking with the Matlab's eig function
    matlabEig = eig(A);
    disp("Eigenvalues calculated by Matlab's function 'eig':")
    disp(matlabEig)
    
end

