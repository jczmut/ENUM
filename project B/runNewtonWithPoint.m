P = [2 0.5 -5 2 -3];
syms x
f = @(x)P(1)*x^4 + P(2)*x^3 + P(3)*x^2 + P(4)*x + P(5);


% getting new number of iterations or staying with the default
imax = 50;
disp("Default maximum number of iterations is 50.")
disp("Would you like to change it?")
answer = input("y/n", 's');
if strcmp(answer, 'y')
    disp("How many iterations would you like to run?")
    imax = input("Enter this number: ");
end


[root1, it1] = newtonWithPoint(f, -2, 10e-9, imax);
[root2, it2] = newtonWithPoint(f, 1.4, 10e-9, imax);



hold on
fplot(f, [-4, 4])
%fplot(f, [2,12])
%xlim([2,12])
fig = gcf;
fig.Color = [0.9290 0.6940 0.1250];
title("Newton's method")
grid on
hold off