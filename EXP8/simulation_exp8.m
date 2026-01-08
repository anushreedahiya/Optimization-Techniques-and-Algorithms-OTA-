% Question 1: single run
clc;
clear;

D = 5;                % Dimension
LB = -10;             % Lower bound
UB = 10;              % Upper bound
T_max = 100;          % Maximum temperature 
T_min = 1e-3          % Final Temperature or minimum
a = 0.95;             % cooling rate
i_max = 100           % total number of iteration
MaxNFE = 10000;       % Function evaluations
K = 1;                

f = @(x) sum(x.^2);   % Objective function

% Initialization
x = LB + (UB - LB) * rand(1, D);
E_old = f(x);

best = E_old;
best_x =x;

record = [];          % storing the function evaluation values
nfe = 1;              % Function evaluation counter (number of function evaluation)

t = T_max;
while t >= T_min && nfe <= MaxNFE
    for (i = 1:i_max)
        if nfe > MaxNFE
            break;
        end

        % successor function
        x_new = x + (UB - LB) .* (rand(1, D) - 0.5);    % x_new = x + (XB - x) * rand; or x_new = x + 2*(XB - x) * rand;
        
        E_new = f(x_new);
        delta = E_new - E_old;

        % acceptance rule
        if(delta < 0 || rand < exp(-delta / (K * t)))
                x = x_new;
                E_old = E_new;
        end

        % new global best
        if E_new < best
            best = E_new;
            best_x = x_new;
        end
    
        % Record best every 100 evaluations
        if mod(nfe,100) == 0
            record(end+1) = best;
        end

        nfe = nfe + 1;
    end
    % cooling rate
    t= t*a;
end

disp('Best solution found:');
disp(best_x);
disp('Best objective value:');
disp(best);

% Plot convergence
figure;
plot(100:100:100*length(record), record, 'LineWidth', 2);
xlabel('Number of Function Evaluations');
ylabel('Best Objective Value');
title('Simulated Annealing Convergence');
grid on;