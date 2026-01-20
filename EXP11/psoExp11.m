clc; 
clear; 
close all;

% Parameters
N = 50; 
MaxIT = 1000; 
D = 30;
LB = -50; 
UB = 50; 
numRuns = 25;
fnums = 3:7;   

methods = {'basic','logistic','circle','kent','piecewise','sine','sinusoidal'};
numMethods = length(methods);
numFuncs = length(fnums);

meanVals = zeros(numFuncs, numMethods);
bestVals = zeros(numFuncs, numMethods);
stdVals  = zeros(numFuncs, numMethods);
iterMeans = zeros(MaxIT, numMethods, numFuncs);

for fi = 1:numFuncs
    f = fnums(fi);
    
    for mi = 1:numMethods
        vals = zeros(numRuns,1);
        allHist = zeros(MaxIT,numRuns);
        
        for run = 1:numRuns
            if strcmp(methods{mi},'basic')
                [history, bestVal] = pso(N, MaxIT, D, LB, UB, f);
            else
                chaos1 = ChaosSeq(MaxIT*N, methods{mi});
                chaos2 = ChaosSeq(MaxIT*N, methods{mi});
                [history, bestVal] = chaotic_pso(N, MaxIT, D, LB, UB, f, chaos1, chaos2);
            end
            vals(run) = bestVal;
            allHist(:,run) = history;
        end
        
        % Save summary
        meanVals(fi,mi)   = mean(vals);
        bestVals(fi,mi)   = min(vals);
        stdVals(fi,mi)    = std(vals);
        iterMeans(:,mi,fi)= mean(allHist,2);
    end
end

colors = lines(numMethods);   
for fi = 1:numFuncs
    figure;
    hold on;
    for mi = 1:numMethods
        plot(iterMeans(:,mi,fi), 'Color', colors(mi,:), 'LineWidth', 1.5);
    end
    hold off;
    legend(methods, 'Location', 'northeast');
    xlabel('Iterations');
    ylabel('Mean Fitness');
    title(sprintf('Convergence on Function f%d (D=%d)', fnums(fi), D));
    grid on;
end

fprintf('\n---Results---\n');
for fi = 1:numFuncs
    fprintf('\nFunction f%d:\n', fnums(fi));
    fprintf('%-12s | %-12s | %-12s | %-12s\n', 'Method','Mean','Best','Std');
    fprintf(repmat('-',1,52)); fprintf('\n');
    for mi = 1:numMethods
        fprintf('%-12s | %-12.4e | %-12.4e | %-12.4e\n', ...
            methods{mi}, meanVals(fi,mi), bestVals(fi,mi), stdVals(fi,mi));
    end
end
