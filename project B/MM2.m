function [xk, iterations] = MM2(P, xk, tolerance, imax)

iterations = 0;

dP = polyder(P);
ddP = polyder(dP);

c = 1;

while abs(c) > tolerance && iterations < imax
    
    a = polyval(ddP, xk)/2;
    b = polyval(dP, xk);
    c = polyval(P, xk);
    
    delta = b^2-4*a*c;
    root1 = -2*c/(b+sqrt(delta));
    root2 = -2*c/(b-sqrt(delta));
    
    % choosing root with smaller absolute value
    if abs(root1) <= abs(root2)
        zmin = root1;
    else
        zmin = root2;
    end
    
    xk = zmin + xk;    
    iterations = iterations + 1;
end
if iterations >= imax
    disp("Maximal number of iterations reached")
end
end

