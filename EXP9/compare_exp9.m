% Q2: compare GA and PSO
clc; clear; close all;

% Parameters
pop_size = 50;
max_iter = 500;
dim = 20;
bounds = [-5 5];
num_runs = 20;
fnums = [0 1 2 3 4];   % 5 objective functions

% Results storage
results = struct();

for f = fnums
    fprintf("\nFunction %d \n", f);

    all_PSO = zeros(num_runs, max_iter);
    all_GA  = zeros(num_runs, max_iter);

    % Run PSO 20 times
    for r = 1:num_runs
        [curve, best_val] = runPSO(f, pop_size, max_iter, dim, bounds);
        all_PSO(r,:) = curve;
    end

    % Run GA 20 times
    for r = 1:num_runs
        [curve, best_val] = runGA(f, pop_size, max_iter, dim, bounds);
        all_GA(r,:) = curve;
    end

    % Compute stats
    results(f+1).PSO.meanVal = mean(all_PSO(:,end));
    results(f+1).PSO.bestVal = min(all_PSO(:,end));
    results(f+1).PSO.stdVal  = std(all_PSO(:,end));
    results(f+1).PSO.curve   = mean(all_PSO,1);

    results(f+1).GA.meanVal = mean(all_GA(:,end));
    results(f+1).GA.bestVal = min(all_GA(:,end));
    results(f+1).GA.stdVal  = std(all_GA(:,end));
    results(f+1).GA.curve   = mean(all_GA,1);

    % Print Results
    fprintf(" PSO -> Mean: %.6f | Best: %.6f | Std: %.6f\n", ...
        results(f+1).PSO.meanVal, results(f+1).PSO.bestVal, results(f+1).PSO.stdVal);
    fprintf(" GA  -> Mean: %.6f | Best: %.6f | Std: %.6f\n", ...
        results(f+1).GA.meanVal, results(f+1).GA.bestVal, results(f+1).GA.stdVal);

    % Plot mean curves
    figure;
    plot(results(f+1).PSO.curve, 'b', 'LineWidth', 1.5); hold on;
    plot(results(f+1).GA.curve, 'r', 'LineWidth', 1.5);
    legend('PSO','GA'); grid on;
    title(sprintf('Function %d: Mean Convergence (20 runs)', f));
    xlabel('Iterations'); ylabel('Fitness');
end

