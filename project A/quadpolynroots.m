function [x1, x2] = quadpolynroots(a, b, c)
% returns the roots of a quadratic equation

    nominator1 = -b + sqrt(b*b - 4*a*c);
    nominator2 = -b - sqrt(b*b - 4*a*c);
    
    % choosing a nominator with a bigger absolute value
    if abs(nominator1) > abs(nominator2)
       nominator = nominator1;
    else
        nominator = nominator2;
    end
    x1 = nominator/(2*a);
    
    % second root is calculated using Viete's equation
    x2 = ((-b)/a) - x1;
end
