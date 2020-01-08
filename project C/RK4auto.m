function [x1, x2, t] = RK4auto(start, finish, h, initialx1, initialx2, er, ea)
% performs RK4 method with automatic step-size adjustment
format long;

hn(1) = h;
x1(1) = initialx1;
x2(1) = initialx2;
t(1) = start;

% main loop
for i=1:ceil((finish-start)/h)
   
    t(i+1) = t(i) + hn(i);
    
    % single step
    [x1_s, x2_s, t_s] = RK4(t(i), hn(i)-t(i), h, x1(i), x2(i));
   
    % double step
    [x1_dv, x2_dv, t_d] = RK4(t(i), hn(i)-t(i), 0.5*h, x1(i), x2(i));
    
    if i == 1
        x1_d = x1_dv(1) + x1_dv(2);
        x2_d = x2_dv(1) + x2_dv(2);
    else
        x1_d = x1_dv;
        x2_d = x2_dv;
    end
    
    % 2^p = 2^4 = 16
    
    % after evaluating gamma from equation for a single step and
    % substituting into equation for a double step
    x1(i+1) = x1_s + (16/15)*(x1_d-x1_s);
    x2(i+1) = x2_s + (16/15)*(x2_d-x2_s);
    
    % errors for single step
    delta_1s = (16/15)*(x1_d-x1_s);
    delta_2s = (16/15)*(x2_d-x2_s);
  
    
    % errors for double step
    delta_1d = (1/15)*(x1_d-x1_s);
    delta_2d = (1/15)*(x2_d-x2_s);
    
    % tolerance e
    e1 = x1_d*er + ea;
    e2 = x2_d*er + ea;
    
    % step-size correction coefficient alfa
    alfa1 = (e1/delta_1d).^(1/5);
    alfa2 = (e2/delta_2d).^(1/5);
    if alfa1 <= alfa2
       alfa = alfa1;
    elseif alfa2 < alfa1
        alfa = alfa2;
    end
    
    % proposed corrected step-size
    hn(i+1) = 0.9*alfa.* hn(i);
    
    if 0.9*alfa >= 1
        
       
        if x1(i) + hn(i) == finish || x2(i) + hn(i) == finish
            break;
        else
           x1(i+1) = x1(i) + hn(i);
           x2(i+1) = x2(i) + hn(i);
           hn(i+1) = min(min(hn(i+1), 5*hn(i)), min(finish-x1(i), finish-x2(i)));
           continue;
        end
    else
        
        if hn(i+1) < eps
           disp("Solution not possible with assumed accuracy.")
           break;
        else
            continue;
        end
    end
    
end



end

