% ques 1: Particle Swarm Optimization
clc; clear; close all;

% Parameters
pop_size = 50;          % number of particles
max_iter = 500;         % maximum number of iterations
dim = 20;                % dimensionality of search space
bounds = [-5 5];        % search limits
c1 = 2; c2 = 2;         % cognitive and social coefficient
w = 0.7;                % inertia weight

% Choose 5 test functions
fnums = [0 1 2 3 4];

for f = fnums
    % Initialize swarm
    X = bounds(1) + (bounds(2)-bounds(1))*rand(pop_size,dim);
    V = zeros(pop_size,dim);
    pbest = X;
    pbest_val = zeros(pop_size,1);
    
    % initial fitness value
    for i = 1:pop_size
        pbest_val(i) = ObjFunc9(f,X(i,:));
    end
    [gbest_val, idx] = min(pbest_val);
    gbest = X(idx,:);
    
    best_curve = zeros(1,max_iter);

    for t = 1:max_iter
        r1 = rand(pop_size,dim);
        r2 = rand(pop_size,dim);
        V = w*V + c1*r1.*(pbest-X) + c2*r2.*(gbest-X);
        X = max(min(X+V,bounds(2)),bounds(1));

        vals = zeros(pop_size,1);
        for i = 1:pop_size
            vals(i) = ObjFunc9(f,X(i,:));
        end

        % Update personal bests
        for i = 1:pop_size
            if vals(i) < pbest_val(i)
                pbest(i,:) = X(i,:);
                pbest_val(i) = vals(i);
            end
        end

        % Update global best
        [min_val,min_idx] = min(vals);
        if min_val < gbest_val
            gbest_val = min_val;
            gbest = X(min_idx,:);
        end
        best_curve(t) = gbest_val;
    end

    fprintf("Function %d best value = %.6f\n", f, gbest_val);

    % Plot convergence
    figure;
    plot(best_curve,'LineWidth',1.5);
    title(sprintf('PSO Convergence for Function %d', f));
    xlabel('Iterations'); ylabel('Best Fitness'); grid on;
end
