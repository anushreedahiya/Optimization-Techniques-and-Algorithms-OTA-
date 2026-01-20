clc; clear; close all;

% Parameters
pop_size = 50;
max_iter = 500;
num_runs = 20;
dim = 30;  % dimension (you can change as needed)
bounds = [-100 100];  % search limits
beta = 3;     % coefficient for ocean current
gamma = 0.1;  % coefficient for Type A swarm

num_funcs = 10; % number of benchmark functions
results = struct();

for f = 1:num_funcs
    fprintf("\nFunction %d \n", f);

    all_runs_best = zeros(num_runs, max_iter);
    final_vals = zeros(num_runs, 1);

    for run = 1:num_runs
        % Initialization using logistic map for diversity
        X = zeros(pop_size, dim);
        x0 = rand(); 
        for i = 1:pop_size
            for j = 1:dim
                x0 = 4*x0*(1 - x0);  % logistic map
                X(i,j) = bounds(1) + x0 * (bounds(2) - bounds(1));
            end
        end

        % Fitness evaluation
        fit = zeros(pop_size, 1);
        for i = 1:pop_size
            fit(i) = ObjFunc12(f, X(i,:));
        end

        [best_val, idx_best] = min(fit);
        BEST = X(idx_best,:);
        best_curve = zeros(1, max_iter);

        % Main loop
        for it = 1:max_iter
            MEAN = mean(X);
            TC = (2*rand() - 1) * abs(1 - it/max_iter);

            for i = 1:pop_size
                if TC >= 0  % Ocean current move
                    Xnew = X(i,:) + rand(1,dim) .* ...
                        (BEST - MEAN .* rand(1,dim) * beta);
                else
                    if rand < 0.5  % Swarm Type A
                        Xnew = X(i,:) + (bounds(2) - bounds(1)) * rand(1,dim) * gamma;
                    else           % Swarm Type B
                        k = randi(pop_size);
                        while k == i, k = randi(pop_size); end
                        if fit(k) >= fit(i)
                            Xnew = X(i,:) + rand(1,dim) .* (X(k,:) - X(i,:));
                        else
                            Xnew = X(i,:) + rand(1,dim) .* (X(i,:) - X(k,:));
                        end
                    end
                end

                % Boundary check
                for d = 1:dim
                    if Xnew(d) < bounds(1)
                        Xnew(d) = bounds(1) + rand() * (bounds(2)-bounds(1));
                    elseif Xnew(d) > bounds(2)
                        Xnew(d) = bounds(2) - rand() * (bounds(2)-bounds(1));
                    end
                end

                fnew = ObjFunc12(f, Xnew);
                if fnew < fit(i)
                    X(i,:) = Xnew;
                    fit(i) = fnew;
                end
            end

            [best_val, idx_best] = min(fit);
            BEST = X(idx_best,:);
            best_curve(it) = best_val;
        end

        all_runs_best(run,:) = best_curve;
        final_vals(run) = best_val;

        fprintf("Run %d | Best = %.6f\n", run, best_val);
    end

    % Stats over 20 runs
    mean_val = mean(final_vals);
    best_val = min(final_vals);
    std_val = std(final_vals);
    avg_curve = mean(all_runs_best, 1);

    % Store results
    results(f).meanVal = mean_val;
    results(f).bestVal = best_val;
    results(f).stdVal = std_val;
    results(f).curve = avg_curve;

    % Print summary
    fprintf("Mean = %.6f | Best = %.6f | Std = %.6f\n", mean_val, best_val, std_val);

    % Plot convergence
    figure;
    plot(avg_curve, 'LineWidth', 1.5);
    title(sprintf('JSO Convergence (Function %d)', f));
    xlabel('Iterations');
    ylabel('Average Best Fitness');
    grid on;
end

% Summary Table
fprintf("\nFinal Summary (20 runs)\n");
fprintf("Func\tMean\t\tBest\t\tStd\n");
for f = 1:num_funcs
    fprintf("%d\t%.4e\t%.4e\t%.4e\n", f, results(f).meanVal, results(f).bestVal, results(f).stdVal);
end
