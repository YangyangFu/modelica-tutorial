
% call matlab ode solver to solve 
tspan = [0, 10];
x0 = 1;
[t,x] = ode45(@DAE, tspan, x0);
plot(t,x,'-o');

% define DAE system in terms of ODE format
function dx=DAE(t, x)
y = sqrt(x^2-1);
dx = (1- y)/2;
end