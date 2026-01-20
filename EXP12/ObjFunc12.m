function f = ObjFunc12(fnum, x)
% 10 Benchmark Functions
% fnum: 0–9

switch fnum
    case 0  % Sphere
        f = sum(x.^2);
    case 1  % Rastrigin
        f = 10*length(x) + sum(x.^2 - 10*cos(2*pi*x));
    case 2  % Rosenbrock
        f = sum(100*(x(2:end)-x(1:end-1).^2).^2 + (x(1:end-1)-1).^2);
    case 3  % Griewank
        f = sum(x.^2)/4000 - prod(cos(x./sqrt(1:length(x)))) + 1;
    case 4  % Ackley
        f = -20*exp(-0.2*sqrt(mean(x.^2))) - exp(mean(cos(2*pi*x))) + 20 + exp(1);
    case 5  % Zakharov
        f = sum(x.^2) + (sum(0.5*(1:length(x)).*x))^2 + (sum(0.5*(1:length(x)).*x))^4;
    case 6  % Schwefel
        f = 418.9829*length(x) - sum(x.*sin(sqrt(abs(x))));
    case 7  % Sum Squares
        f = sum((1:length(x)).*(x.^2));
    case 8  % Step
        f = sum(floor(x+0.5).^2);
    case 9  % Quartic + Noise
        f = sum((1:length(x)).*(x.^4)) + rand;
    case 10  % Levy Function
        w = 1 + (x - 1)/4;
        f = sin(pi*w(1))^2 + sum((w(1:end-1)-1).^2.*(1+10*sin(pi*w(1:end-1)+1).^2)) + (w(end)-1)^2*(1+sin(2*pi*w(end))^2);
    otherwise
        error('Invalid function number (0–9)');
end
end
