
% plots the approximation function of specified order n
n = 7;
%n = 5;
%n = 4;
%n = 3;
%n = 2;

[x,y] = generateData;

% create the Gram matrix
[G,q] = GramMatrix(x,y,n);

% solve the set of normal equations
[a, ~, ~] = solveNormalEquations(G,q);
disp(a)

% plot the graph
plot(x, y, 'pr')
hold on
syms x
f = @(x)a(8)*x^7+a(7)*x^6+a(6)*x^5+a(5)*x^4 + a(4)*x^3 + a(3)*x^2 + a(2)*x + a(1);
%f = @(x)a(6)*x^5+a(5)*x^4 + a(4)*x^3 + a(3)*x^2 + a(2)*x + a(1);
%f = @(x)a(5)*x^4 + a(4)*x^3 + a(3)*x^2 + a(2)*x + a(1);
%f = @(x)a(4)*x^3 + a(3)*x^2 + a(2)*x + a(1);
%f = @(x)a(3)*x^2 + a(2)*x + a(1);


fplot(f)
grid on
xlim([-5, 5])
fig = gcf;
fig.Color = [0.9290 0.6940 0.1250];
% title("Approximating polynomial of order 7")
% legend("Data points", "0.0001x^7-0.0013x^6-0.0039x^5+0.0489x^4+0.0842x^3+0.3396x^2-0.7885x-0.3725", 'Location', 'best')
% title("Approximating polynomial of order 5")
% legend("Data points", "-0.0004x^5-0.0015x^4+0.0420x^3+0.7968x^2-0.6684x-0.9554", 'Location', 'best')
% title("Approximating polynomial of order 4")
% legend("Data points", "-0.0015x^4+0.0304x^3+0.7968x^2-0.5986x-0.9554", 'Location', 'best')
% title("Approximating polynomial of order 3")
% legend("Data points", "0.0304x^3+0.7592x^2-0.5986x-0.8472", 'Location', 'best')
% title("Approximating polynomial of order 2")
% legend("Data points", "0.7592x^2-0.0572x-0.8472", 'Location', 'best')
title("Approximating polynomials")
legend("Data points", "Approximations", 'Location', 'best')

