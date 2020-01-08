
% COMPARISON OF SOLUTION CURVES x1 vs x2
% 
% % optimal step-size
% %[x1_1,x2_1, t_1] = RK4(0,10,0.01, 8,8);
% [x1_1,x2_1, t_1] = P5EC5E(0,10,0.01, 8,8);
% 
% % bigger step-size
% %[x1_2,x2_2, t_2] = RK4(0,10,0.018, 8,8);
% [x1_2,x2_2, t_2] = P5EC5E(0,10,0.015, 8,8);
% 
% % plotting optimal vs larger step-size difference
% hold on
% plot(x1_1, x2_1)
% plot(x1_2, x2_2)
% legend("optimal step-size h=0.01", "larger step-size h=0.015", 'Location', 'best')
% title("Optimal vs not optimal step-size")
% xlabel("x1")
% ylabel("x2")
% fig = gcf;
% fig.Color = [0, 0.75, 0.75];
% grid on
% hold off

% ------------------------------------------
% COMPARISON OF SOLUTION VS TIME

% optimal step-size
[x1_1,x2_1, t_1] = RK4(0,10,0.01, 8,8);
%[x1_1,x2_1, t_1] = P5EC5E(0,10,0.01, 8,8);

% bigger step-size
[x1_2,x2_2, t_2] = RK4(0,10,0.018, 8,8);
%[x1_2,x2_2, t_2] = P5EC5E(0,10,0.015, 8,8);

% plotting optimal vs larger step-size difference
hold on
%plot(t_1, x1_1)
%plot(t_2, x1_2)
plot(t_1, x2_1)
plot(t_2, x2_2)
% ode45
[to, x] = ode45(@(to,x) [x(2)+x(1)*(0.5-x(1)^2-x(2)^2); -x(1)+x(2)*(0.5-x(1)^2-x(2)^2)], [0, 10], [8, 8]);
%plot(to,x(:,1))
plot(to,x(:,2))
legend("optimal step-size h=0.01", "larger step-size h=0.018", "ode45", 'Location', 'best')
title("Solution vs time for optimal and not optimal step-sizes")
xlabel("t")
%ylabel("x1")
ylabel("x2")
fig = gcf;
fig.Color = [0.75, 0.75, 0];
grid on
hold off



