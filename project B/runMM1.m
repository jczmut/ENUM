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
x0 = 0;
x1 = 0.8i;
x2 = 1.75i;
[root1, it1] = MM1(P, x0, x1, x2, 10e-9, imax);
plot(x0, f(x0), 'go')
plot(root1, f(root1), 'rx')
plot(x1, f(x1), 'go')
plot(x2, f(x2), 'go')
%disp("root: " + root1)
%disp("iterations: " + it1)

% for second root
x0 = 0;
x1 = -0.8i;
x2 = -1.75i;
[root2, it2] = MM1(P, x0, x1, x2, 10e-9, imax);
plot(x0, f(x0), 'go')
plot(x1, f(x1), 'go')
plot(x2, f(x2), 'go')
plot(root2, f(root2), 'rx')
%disp("root: " + root2)
%disp("iterations: " + it2)

% for third root
x0 = -1.5;
x1 = -2;
x2 = -2.5;
[root3, it3] = MM1(P, x0, x1, x2, 10e-9, imax);
plot(x0, f(x0), 'go')
plot(x1, f(x1), 'go')
plot(x2, f(x2), 'go')
plot(root3, f(root3), 'rx')
%disp("root: " + root3)
%disp("iterations: " + it4)
%
% for fourth root
x0 = 1;
x1 = 1.5;
x2 = 2;
[root4, it4] = MM1(P, x0, x1, x2, 10e-9, imax);
plot(x0, f(x0), 'go')
plot(x1, f(x1), 'go')
plot(x2, f(x2), 'go')
plot(root4, f(root4), 'rx')
% disp("root: " + root4)
% disp("iterations: " + it4)

title("MM1 method")
legend('2x^4+0.5x^3-5x^2+2x-3', 'Initial points', 'Roots')
legend('Location', 'best')

hold off


