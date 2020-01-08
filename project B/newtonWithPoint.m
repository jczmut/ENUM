function [root, iterations] = newtonWithPoint(f, x, tolerance, imax) 

hold on   
plot(x, f(x), 'go')
grid on

root = x;
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
legend('initial point', 'root')
legend('Location', 'best')
hold off

end


