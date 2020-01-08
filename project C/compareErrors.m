
% compares the approximating polynomials with respect to their errors
% plots the dependency between the error and the order of polynomial

[x, y] = generateData;

for i=2:1:10
    
    [G, q] = GramMatrix(x, y, i);
    [~, error, cond] = solveNormalEquations(G,q);
    disp(i)
    disp(error)
    disp(cond)
    semilogy(i, error, 'r*')
    hold on
end

fig = gcf;
fig.Color = [0.4660, 0.6740, 0.1880];
grid on
title("Dependence between the error and the order of the polynomial")
xlabel("order of the polynomial")
ylabel("solution error")
hold off


