% Question 1: single run
clc;
clear;

D = 5;                % Dimension
LB = -10 * ones(1,D); % Lower bound
UB = 10 * ones(1,D);  % Upper bound
Npop = 50;            % Population size
Maxiter = 200;        % Max iterations
CR = 0.6;             % Crossover rate
MR = 0.05;            % Mutation rate

% Initialize Population
X = zeros(Npop, D);
for i = 1:Npop
    for j = 1:D
        X(i,j) = LB(j) + rand() * (UB(j) - LB(j));
    end
end

% Evaluate Initial Population
fitness = zeros(Npop,1);
for i = 1:Npop
    % fitness(i) = ObjFun7(X(i,:), fnumber)
    fitness(i) = ObjFun7(X(i,:));
end

best_vals = zeros(Maxiter,1);

% Main Loop
for it = 1:Maxiter
    for i = 1:Npop
        r1 = randi([1 Npop]);   % r1 != i
        while r1 == i
            r1 = randi([1 Npop]);
        end

        % Crossover
        if rand() < CR
            % Single point crossover (first half from i, second half from r1)
            cross_point = floor(D/2);
            X_new = [X(i,1:cross_point), X(r1,cross_point+1:end)];
        else
            X_new = X(i,:);
        end

        % Mutation
        if rand() < MR
            r2 = randi([1 D]);
            X_new(r2) = LB(r2) + rand() * (UB(r2) - LB(r2));
        end

        % Evaluate new candidate
        f_new = ObjFun7(X_new);

        % Replacement (for maximization)
        if f_new > fitness(i)
            X(i,:) = X_new;
            fitness(i) = f_new;
        end
    end

    % Sort by fitness (in descending order)
    [fitness, idx] = sort(fitness, 'descend');
    X = X(idx,:);

    % Store best
    best_vals(it) = fitness(1);

    % Print best of iteration
    fprintf("Iteration %d: Best Fitness = %.6f\n", it, fitness(1));
end

% Plot best fitness over iterations
figure;
plot(1:Maxiter, best_vals, 'b-', 'LineWidth', 2);
xlabel('Iteration');
ylabel('Best Fitness');
title('Genetic Algorithm Convergence');
grid on;

 
 
% % Question n2 with 20 run defined
% clc;
% clear;
% 
% D = 10;                 % Dimension
% LB = -10 * ones(1,D);   % Lower bound
% UB = 10 * ones(1,D);    % Upper bound
% n = 50;                 % Population size
% MaxIter = 200;          % Max iterations
% CR = 0.6;               % Crossover rate
% MR = 0.05;              % Mutation rate
% minMax = 0;             % 0=minimize, 1=maximize
% 
% run = 20;               % number of runs
% 
% allRunsBest = zeros(run, MaxIter); % store best of each run
% 
% for run = 1:run
%     % Initialization
%     X = zeros(n, D);
%     fit = zeros(n, 1);
% 
%     for i = 1:n
%         for j = 1:D
%             X(i,j) = LB(j) + rand()*(UB(j)-LB(j));
%         end
%         fit(i) = ObjFun7(X(i,:), 0);
%     end
% 
%     % Main loop
%     for it = 1:MaxIter
%         for i = 1:n
%             r1 = randi(n);   % r1 ≠ i
%             while r1 == i
%                 r1 = randi(n);
%             end
% 
%             Xi = X(i,:);
%             Xnew = Xi; % copy
% 
%             % Crossover
%             if rand < CR
%                 cross_point = randi([1 D/2]); % single point crossover of half vector
%                 Xnew(1:cross_point) = X(r1,1:cross_point);
%             end
% 
%             % Mutation
%             if rand < MR
%                 r2 = randi(D);
%                 Xnew(r2) = LB(r2) + rand()*(UB(r2)-LB(r2));
%             end
% 
%             % Evaluate new objective function value
%             fnew = ObjFun7(Xnew, 0);
% 
%             % Replace with the best by comparing
%             if fnew < fit(i)  % for minimization
%                 X(i,:) = Xnew;
%                 fit(i) = fnew;
%             end
%         end
% 
%         % Sort population by fitness
%         [fit, idx] = sort(fit, 'ascend'); % minimizing
%         X = X(idx,:);
% 
%         % Store best of this iteration
%         bestFit = fit(1);
%         allRunsBest(run,it) = bestFit;
% 
%         fprintf("Run %d, Iter %d, Best = %.6f\n", run, it, bestFit);
%     end
% end
% 
% % Average across runs
% avgBest = mean(allRunsBest, 1);
% 
% % Plot results
% figure;
% plot(1:MaxIter, avgBest, 'r-', 'LineWidth', 2);
% xlabel('Iteration');
% ylabel('Average Best Fitness');
% title('Average Best Fitness over 20 Runs (GA)');
% grid on;
