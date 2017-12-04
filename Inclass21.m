%In class 21
%GB comments
1 100
2 100
overall 100


% 1. Consider the system we discussed in class for a gene which is produced
% and degraded: dx/dt = k - d*x. Now consider that this gene turns on a
% second gene y, which also degrades so that its equation is 
% dy/dt = k2*x - d2*y. Choose some values for k,d,k2, and d2 and run a
% numerical simulation of this system for the case where both genes start
% out off ( x(0) = 0 and y(0) = 0). Plot the value of x and y in time and 
% explain your results. 

k = 2;
d = 2;
k2 = 3; 
d2 = 3;

rhs = @(t,x) [2-2*x(1); 3*x(1) - 3*x(2)];
sol = ode23(rhs, [0 10], [0, 0]);
plot(sol.x, sol.y(1, :), 'r.-'); hold on;
plot(sol.x, sol.y(2, :), 'b.-');
legend({'x', 'y'});

% Both curves begin to approach 1 asymptotically. At about t = 3, x is
% mostly degraded.

% 2. Consider the following model: 
% dx/dt = y
% dy/dt = (1-x^2)*y - x
% write code that simulates this system for several different starting
% values of x and y. Plot the results and comment on them. 

rhs2 = @(t,x) [x(2); (1-x(1)^2)*x(2) - x(1)];
for ii = 1:5
    xx = randi(10);
    yy = randi(10);
    sol = ode23(rhs2, [0 10], [xx, yy]);
    plot(sol.x, sol.y(1,:)); hold on;
    plot(sol.x, sol.y(2,:));
    disp(xx);
    disp(yy);
end

% In the cases where x > y, dy/dt would asymptotically approach 0. In the
% cases where y > x, the curves appear to fluctuate. 
