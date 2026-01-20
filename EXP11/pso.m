function [history, bestVal] = pso(N, MaxIT, D, LB, UB, fnum)
w = 0.7;       % inertia
c1 = 1.5;      % cognitive
c2 = 1.5;      % social

X = LB + rand(N, D) * (UB - LB);
V = zeros(N, D);
pbest = X;
pbest_val = arrayfun(@(i) ObjFunc11(fnum, X(i,:)), 1:N);
[gbest_val, idx] = min(pbest_val);
gbest = X(idx,:);

history = zeros(MaxIT,1);

for it = 1:MaxIT
    for i = 1:N
        r1 = rand; r2 = rand;
        V(i,:) = w*V(i,:) + c1*r1*(pbest(i,:) - X(i,:)) + c2*r2*(gbest - X(i,:));
        X(i,:) = X(i,:) + V(i,:);
        X(i,:) = min(max(X(i,:), LB), UB); % boundary check

        fnew = ObjFunc11(fnum, X(i,:));
        if fnew < pbest_val(i)
            pbest(i,:) = X(i,:);
            pbest_val(i) = fnew;
        end
    end

    [curr_best, idx] = min(pbest_val);
    if curr_best < gbest_val
        gbest_val = curr_best;
        gbest = pbest(idx,:);
    end
    history(it) = gbest_val;
end

bestVal = gbest_val;
end
