function [root, iterations] = newton(f, x0, x1, tolerance, imax) 

hold on   
plot(x0, f(x0), 'go')
plot(x1, f(x1), 'ro')
grid on

root = (x0 + x1)/2;
iterations = 0;

% derivative of f(x)
syms x
dfdx = eval(['@(x)' char(diff(f(x)))]);

for i=1:imax
    root = root - (f(root)/dfdx(root));
    iterations = iterations + 1;
    
    % stop test
    if abs(f(root)) <= tolerance
       break; 
    end
end
if i >= imax
    disp("Maximal number of iterations reached")
end

plot(root, f(root), 'kx')
legend('left subinterval limit', 'right subinterval limit', 'root')
legend('Location', 'best')
hold off

end

