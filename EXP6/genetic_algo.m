clc;
clear;

minMax = 0; % 0=minimize, 1=maximize
n = 50; 
MaxIter = 200;
D = 10; 
min_x = -10;
max_x = 10;

run = 5; % number of runs
summer = 0;
c = zeros(run,1);

if minMax == 1
    sortMode = 'descend';
else
    sortMode = 'ascend';
end

for k = 1:run
    x = zeros(n, D);
    fit = zeros(n, 1);

    % Initialize population and evaluate fitness
    for i = 1:n
        for j = 1:D
            x(i, j) = (max_x - min_x) * rand() + min_x;
        end
        fit(i) = ObjFunc(x(i, :), 0);
    end

    iteration = 1;
    while iteration < MaxIter
        array = fit; 

        % Selection 
        [~, index] = sort(array, sortMode);

        fitness(iteration) = fit(index(1));
        no(iteration) = iteration;

        % Crossover 
        for i = 1:D
            x(index(n), i)     = x(index(1 + mod(i, 2)), i);
            x(index(n-1), i)   = x(index(1 + mod(i+1, 2)), i);
        end

        % Mutation 
        rand_num = randi([1 D], 1);
        x(index(n), rand_num) = (max_x - min_x) * rand() + min_x;

        % Fitness re-evaluation
        for i = 1:n
            fit(i) = ObjFunc(x(i, :), 0);
        end

        iteration = iteration + 1;
    end

    disp("fit")
    disp(fit(index(1)))

    summer = summer + fit(index(1));
    c(k,1) = fit(index(1));

    % Plot for each run
    figure;
    plot(no(1:MaxIter-1), fitness(1:MaxIter-1), 'Linewidth', 2, 'Color', 'r');
    ylabel('Fitness', 'FontSize', 15);
    xlabel('Iteration', 'FontSize', 15);
    title(['Run ', num2str(k)]);
end

disp("average")
disp(summer/run)

disp("best")
disp(min(c))