function plotJacobiAndGS(A, b)
% plots the dependence between solution errors and the number of iterations
% needed until certain error treshold is reached and
% comparing Jacobi's and Gauss-Seidel methods

[~, errorsJacobi, iterationsJacobi] = solveJacobi(A, b);
[~, errorsGS, iterationsGS] = solveGaussSeidel(A, b);

plot(iterationsJacobi, errorsJacobi, ':og')
hold on
plot(iterationsGS, errorsGS, '--*r')
legend("Jacobi method", "Gauss-Seidel method");
set(legend, 'Location', 'northeast');
xlabel("Number of iterations");
ylabel("Solution error");
hold off
grid on;
d
title("Dependence between solution errors" + newline + "and the number of iterations" + newline + "for both methods");


end