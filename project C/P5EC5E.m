function [x1, x2, t] = P5EC5E(start, finish, h, initialx1, initialx2)
% performs Adams P5EC5E method
k = 5;

% defining the function
f1 = @(t,x1,x2) (x2 + x1*(0.5 - (x1)^2 - (x2)^2));
f2 = @(t,x1,x2) (-x1 + x2*(0.5 - (x1)^2 - (x2)^2));

% beta parameters for explicit and implicit versions
betaEx = [1901/720, -2774/720, 2616/720, -1274/720, 251/720];
betaIm = [475/1440, 1427/1440, -798/1440, 482/1440, -173/1440, 27/1440];

% starting procedure for first 5 points using RK4
[x1,x2,t] = RK4(start, ((k*h)-start), h, initialx1, initialx2);


for i=6:ceil(finish-start)/h
  
% defining how t changes
t(1+i) = t(i)+h;
    
% explicit sum from the formula
sumEx1 = 0;
sumEx2 = 0;

for j=1:k
   sumEx1 = sumEx1 + betaEx(j) * f1(t(i-j), x1(i-j), x2(i-j));
   sumEx2 = sumEx2 + betaEx(j) * f2(t(i-j), x1(i-j), x2(i-j));
end

% implicit sum from the formula
sumIm1 = 0;
sumIm2 = 0;

for j=2:k
   sumIm1 = sumIm1 + betaIm(j) * f1(t(i-j), x1(i-j), x2(i-j));
   sumIm2 = sumIm2 + betaIm(j) * f2(t(i-j), x1(i-j), x2(i-j));
end
    
% main equations ( P E C E )
% P
x1(i+1) = x1(i) + h * sumEx1;
x2(i+1) = x2(i) + h * sumEx2;
% E
fn1 = f1(t(i+1), x1(i+1), x2(i+1));
fn2 = f2(t(i+1), x1(i+1), x2(i+1));
% C
x1(i+1) = x1(i) + h * sumIm1 + h*betaIm(1)*fn1;
x2(i+1) = x2(i) + h * sumIm2 + h*betaIm(1)*fn2;
% E
fn1 = f1(t(i+1), x1(i+1), x2(i+1));
fn2 = f2(t(i+1), x1(i+1), x2(i+1));

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
% legend("P5EC5E", "ODE45", 'Location', 'best')
% title("P5EC5E vs ODE45 for step-size h = 0.019")
% fig = gcf;
% fig.Color = [0.4660, 0.6740, 0.1880];
% grid on
% hold off



end

