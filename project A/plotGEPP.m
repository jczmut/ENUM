function plotGEPP(numberOfIterations, task)
% plots the dependence between solution errors and number of equations n=10,20,40,80,... 

n = 10;
for i = 1: numberOfIterations
    switch task
        case 'A'
            [A, b] = generateATask(n);
        case 'B'
            [A, b] = generateBTask(n);
        otherwise
            error("Data at the input is wrong.")
    end
    [~, solutionErrors, improvedErrors] = solveGEPP(A, b);
    % filling up the vectors with data in each iteration
    numberOfEquationsVector(i) = n;
    errorsVector(i) = solutionErrors;
    improvedErrorsVector(i) = improvedErrors;
    n = n*2;    % n = 10,20,40,80,160,...
end  
    
% DRAWING THE GRAPHS
plot(numberOfEquationsVector, errorsVector, "pg")
hold on
plot(numberOfEquationsVector, improvedErrorsVector, "ob")
legend("Before improvement", "After improvement");
set(legend, 'Location', 'northwest')
hold off
xlabel("Number of equations");
ylabel("Solution error");
grid on;
fig = gcf;
fig.Color = [0.4660 0.6740 0.1880];
title("Dependence between solution errors" + newline +" and the number of equations");

end

