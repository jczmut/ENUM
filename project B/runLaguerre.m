P = [2 0.5 -5 2 -3];

% getting new number of iterations or staying with the default
imax = 10;
disp("Default maximum number of iterations is 50.")
disp("Would you like to change it?")
answer = input("y/n", 's');
if strcmp(answer, 'y')
    disp("How many iterations would you like to run?")
    imax = input("Enter this number: ");
end

syms x
f = @(x)P(1)*x^4 + P(2)*x^3 + P(3)*x^2 + P(4)*x + P(5);

hold on
fplot(f)
grid on
xlim([-4, 4])
fig = gcf;
fig.Color = [0.9290 0.6940 0.1250];


% for first root
xk = 1i;
[root1, it1] = laguerre(P, xk, 10e-9, imax);
plot(xk, f(xk), 'go')
plot(root1, f(root1), 'rx')
disp("root: " + root1)
disp("iterations: " + it1)

% for second root
xk = -1i;
[root2, it2] = laguerre(P, xk, 10e-9, imax);
plot(xk, f(xk), 'go')
plot(root2, f(root2), 'rx')
disp("root: " + root2)
disp("iterations: " + it2)

% for third root
xk = 2;
[root3, it3] = laguerre(P, xk, 10e-9, imax);
plot(xk, f(xk), 'go')
plot(root3, f(root3), 'rx')
disp("root: " + root3)
disp("iterations: " + it3)

% for fourth root
xk = -2;
[root4, it4] = laguerre(P, xk, 10e-9, imax);
plot(xk, f(xk), 'go')
plot(root4, f(root4), 'rx')
disp("root: " + root4)
disp("iterations: " + it4)

title("Laguerre's method")
legend('2x^4+0.5x^3-5x^2+2x-3', 'Initial points', 'Roots')
legend('Location', 'best')

hold off


