function [root, iterations] = secant(f, x0, x1, tolerance, imax)

iterations = 0;

hold on
plot(x0, f(x0), 'go')
plot(x1, f(x1), 'ro')
grid on

for i=1:imax
    x2 = (x0*f(x1) - x1*f(x0))/(f(x1) - f(x0));
    x0 = x1;
    x1 = x2;
    root = x2;
    iterations = iterations + 1;
    
    if abs(x1 - x0) < tolerance
        break
    end
end
if i >= imax
    disp("Maximal number of iterations reached")
end

plot(root, f(root), 'bx')
legend('left subinterval limit', 'right subinterval limit', 'root')
legend('Location', 'best')
hold off

end

