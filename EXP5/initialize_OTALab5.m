% % 1. Initialize population
% N = 100;
% D = 2;
% LB = -50;
% UB = 100;
% 
% population = LB + (UB - LB)*rand(N, D);
% disp("Sample display: ");
% disp(population(1:5, :)); % first 5 individuals display
% 
% figure;
% scatter(population(:, 1), population(:, 2), 'filled');
% xlabel('Dimension 1');
% ylabel('Dimension 2');
% title('Initial Population Distribution');
% grid on;

% 2. Implement Opposition-based Learning (OBL)
% N = 100;
% D = 2;
% LB = -50;
% UB = 100;
% % Initialize
% X = LB + (UB - LB)*rand(N, D);
% X_opposite = LB + UB -X;
% X_total = [X; X_opposite];  % Combining both X and X_opposite
% % Cost function Z = x^2 + y^2
% Z = sum(X_total.^2, 2);
% % sorting to select best values out of those 200
% [~, idx] = sort(Z);
% X_best = X_total(idx(1:N), :);
% 
% % Initial Population
% figure;
% subplot(1,2,1);
% scatter(X(:, 1), X(:, 2), 'filled');
% xlabel('Dimension 1');
% ylabel('Dimension 2');
% title('Initial Population');
% grid on;
% 
% % Plot after OBL
% subplot(1,2,2);
% scatter(X_best(:,1), X_best(:,2), 'filled');
% title('Population After OBL');
% xlabel('Dimension 1'); ylabel('Dimension 2');
% grid on;

% 3. Optimization Algorithm characteristics
N = 100;    % population size
MaxIT = 500;    % Max iterations

D = 5;  % dimension is 2 as only 2 variables are there in the objective function
LB = input('Enter lower bound: ');
UB = input('Enter upper bound: ');

% Objective function, fobj = x^2 + y^2
fobj = @(x) sum(x.^2, 2); 

% Initializing
X = LB + (UB - LB) * rand(N, D);
fitness = fobj(X)

% Global best
[bestVal, bestIdx] = min(fitness);
globalBest = X(bestIdx, :);

bestHistory = zeros(MaxIT, 1);       % Store best value at each iteration

for it = 1:MaxIT
    for i = 1:N
        alpha = rand();
        % Moving towards global best
        X_new = X(i, :) + alpha * (globalBest - X(i, :));

        % Bound check
        X_new = max(min(X_new, UB), LB);

        % Evaluate new fitness
        newFit = fobj(X_new);

        % Replace if better
        if newFit < fitness(i)
            X(i, :) = X_new;
            fitness(i) = newFit;
        end
    end

    % Updating global best after all updates
    [bestVal, bestIdx] = min(fitness);
    globalBest = X(bestIdx, :);

    % Store best value
    bestHistory(it) = bestVal;
end

fprintf('\nBest value found: %.4f at (x = %.4f, y = %.4f)\n', bestVal, globalBest(1), globalBest(2));

figure;
plot(1:MaxIT, bestHistory, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Best Fitness Value');
title('Convergence of Global Best Over Iterations');
grid on;