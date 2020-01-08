function [x1, x2, t] = RK4(start, finish, h, initialx1, initialx2)
% performs Runge-Kutta method of order 4

% defining variables
%t(1) = start;
t = start:h:finish;
x1(1) = initialx1;
x2(1) = initialx2;

% defining the function
f1 = @(t,x1,x2) (x2 + x1*(0.5 - (x1)^2 - (x2)^2));
f2 = @(t,x1,x2) (-x1 + x2*(0.5 - (x1)^2 - (x2)^2));

% calculation loop
for i=1:(length(t)-2)
   
    k11 = f1(t(i), x1(i), x2(i));
    k12 = f2(t(i), x1(i), x2(i));
    k21 = f1(t(i)+0.5*h, x1(i)+0.5*h*k11, x2(i)+0.5*h*k12);
    k22 = f2(t(i)+0.5*h, x1(i)+0.5*h*k11, x2(i)+0.5*h*k12);
    k31 = f1(t(i)+0.5*h, x1(i)+0.5*h*k21, x2(i)+0.5*h*k22);
    k32 = f2(t(i)+0.5*h, x1(i)+0.5*h*k21, x2(i)+0.5*h*k22);
    k41 = f1(t(i)+h, x1(i)+h*k31, x2(i)+h*k32);
    k42 = f2(t(i)+h, x1(i)+h*k31, x2(i)+h*k32);
    
    % main equation
    x1(i+1) = x1(i)+1/6*h*(k11 + 2*k21 + 2*k31 + k41);
    x2(i+1) = x2(i)+1/6*h*(k12 + 2*k22 + 2*k32 + k42);
    
end


% % plotting the data
% hold on
% plot(x1, x2)
% 
% % ode45
% [to, x] = ode45(@(to,x) [x(2)+x(1)*(0.5-x(1)^2-x(2)^2); -x(1)+x(2)*(0.5-x(1)^2-x(2)^2)], [start, finish], [initialx1,initialx2]);
% plot(x(:,1),x(:,2))
% xlabel("x1")
% ylabel("x2")
% legend("RK4", "ODE45", 'Location', 'best')
% title("RK4 vs ODE45 for step-size h = 0.01")
% fig = gcf;
% fig.Color = [0.4660, 0.6740, 0.1880];
% grid on
% hold off



end

