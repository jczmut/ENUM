function [root, iterations] = MM1(P, x0, x1, x2, tolerance, imax)

iterations = 0;
c = 1;

while abs(c) > tolerance && x0 ~= x1 && x1 ~= x2 && iterations < imax
    
    z0 = x0 - x2;
    z1 = x1 - x2;
    
    c = polyval(P, x2);
    b = (polyval(P, x2) * (z1 + z0) * (z1 - z0) + z0 * z0 * polyval(P, x1) - z1 * z1 * polyval(P, x0))/((z0 - z1) * z0 * z1);
    a = (polyval(P, x0) - polyval(P, x2))/(z0*z0) - b/z0;
    delta = b*b - 4*a*c;
    
    if abs(b+sqrt(delta)) >= abs(b-sqrt(delta))
        root = x2 - (2*c)/(b + sqrt(delta));
    else
        root = x2 - (2*c)/(b - sqrt(delta));
    end
    
    d0 = abs(root -x0);
    d1 = abs(root -x1);
    d2 = abs(root -x2);

    if d0 >= d1 && d0 >= d2
        x0 = x2;
        x2 = root;
    elseif d1 >= d0 && d1 >= d2
        x1 = x2;
        x2 = root;
    elseif d2 >= d0 && d2 >= d1
        x2 = root;
    end
    
    iterations = iterations +1;
end
if iterations >= imax
    disp("Maximal number of iterations reached")
end

end

