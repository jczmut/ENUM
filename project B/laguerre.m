function [root, iterations] = laguerre(P, xk, tolerance, imax)

iterations = 0;

dP = polyder(P);
ddP = polyder(dP);
n = length(P) - 1;
e = 1;

while e > tolerance && iterations < imax
    
    e = polyval(P, xk);
    
    expFromDenominator = sqrt((n-1) * ((n-1) * (polyval(dP, xk)^2) - n*polyval(P, xk)*polyval(ddP, xk)));
    
    % choosing largest absolute value for the denominator
    if abs(polyval(dP, xk) + expFromDenominator) > abs(polyval(dP, xk) - expFromDenominator)
        denominator = polyval(dP, xk) + expFromDenominator;
    else
        denominator = polyval(dP, xk) - expFromDenominator;
    end
    
    % formula for Laguerre's method
    xk = xk - (n * polyval(P, xk) / denominator);
    iterations = iterations + 1;
end
if iterations >= imax
    disp("Maximal number of iterations reached")
end
root = xk;

end

