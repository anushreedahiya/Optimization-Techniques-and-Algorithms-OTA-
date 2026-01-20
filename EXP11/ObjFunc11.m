function f = ObjFunc11(fnum, x)
% Benchmark Objective Functions (0–9)
switch fnum
    case 0  % Sphere
        f = sum(x.^2);
    case 1  % Rosenbrock
        f = sum(100*(x(2:end)-x(1:end-1).^2).^2 + (1-x(1:end-1)).^2);
    case 2  % Rastrigin
        f = 10*numel(x) + sum(x.^2 - 10*cos(2*pi*x));
    case 3  % Griewank
        f = sum(x.^2)/4000 - prod(cos(x./sqrt(1:numel(x)))) + 1;
    case 4  % Ackley
        f = -20*exp(-0.2*sqrt(mean(x.^2))) - exp(mean(cos(2*pi*x))) + 20 + exp(1);
    case 5  % Schwefel
        f = 418.9829*numel(x) - sum(x.*sin(sqrt(abs(x))));
    case 6  % Zakharov
        n = numel(x);
        f = sum(x.^2) + (0.5*(1:n)*x').^2 + (0.5*(1:n)*x').^4;
    case 7  % Sum of Squares
        f = sum((1:numel(x)).*(x.^2));
    case 8  % Step
        f = sum(floor(x+0.5).^2);
    case 9  % Quartic
        f = sum((1:numel(x)).*(x.^4)) + rand;
    otherwise
        error('Invalid function number (0–9)');
end
end
