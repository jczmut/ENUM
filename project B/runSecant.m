f = @(x)1.2*x*sin(x)-2*log(x+2)

% getting new number of iterations or staying with the default
imax = 30;
disp("Default maximum number of iterations is 50.")
disp("Would you like to change it?")
answer = input("y/n", 's');
if strcmp(answer, 'y')
    disp("How many iterations would you like to run?")
    imax = input("Enter this number: ");
end

% dividing the interval [2,12] into two parts

[root2, it2] = secant(f, 6, 8, 10e-9, imax);
[root3, it3] = secant(f, 8.1, 12, 10e-9, imax);

hold on
fplot(f, [2,12])
xlim([2,12])
fig = gcf;
fig.Color = [0.9290 0.6940 0.1250];
title("Secant method")

disp(root2)
disp(it2)
disp(root3)
disp(it3)

