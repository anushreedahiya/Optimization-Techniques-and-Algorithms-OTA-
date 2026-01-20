function [history, bestVal] = chaotic_pso(N, MaxIT, D, LB, UB, fnum, chaos1, chaos2)
% Chaotic PSO version
w = 0.7; c1 = 1.5; c2 = 1.5;

X = LB + rand(N, D) * (UB - LB);
V = zeros(N, D);
pbest = X;
pbest_val = arrayfun(@(i) ObjFunc11(fnum, X(i,:)), 1:N);
[gbest_val, idx] = min(pbest_val);
gbest = X(idx,:);
history = zeros(MaxIT,1);

for it = 1:MaxIT
    for i = 1:N
        r1 = chaos1(mod(i*it, length(chaos1))+1);
        r2 = chaos2(mod(i*it, length(chaos2))+1);
        V(i,:) = w*V(i,:) + c1*r1*(pbest(i,:) - X(i,:)) + c2*r2*(gbest - X(i,:));
        X(i,:) = X(i,:) + V(i,:);
        X(i,:) = min(max(X(i,:), LB), UB);
        
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
