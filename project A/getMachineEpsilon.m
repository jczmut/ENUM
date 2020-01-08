function getMachineEpsilon

% to get more precise reading
format long;

number = 1.0;
while((1.0 + (number/2.0)) > 1.0)
    number = number/2.0;
end

disp("Calculated machine epsilon: ")
disp(number)

disp("Matlab's result of eps: ")
disp(eps)
end