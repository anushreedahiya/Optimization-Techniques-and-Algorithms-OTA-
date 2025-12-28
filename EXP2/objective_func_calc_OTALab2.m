% 6. Function to calculate objective function and printing appropriate
% message for constraints violation
function obj_result = objective_func_calc_OTALab2(x1, x2, x3, x4)
if x1 < 0 || x1 > 99
    disp("Constraint violated: 0 <= x1 <= 99")
    obj_result = NaN; return;
end
if x2 < 0 || x2 > 99
    disp("Constraint violated: 0 <= x2 <= 99")
    obj_result = NaN; return;
end
if x3 < 0 || x3 > 200
    disp("Constraint violated: 0 <= x3 <= 200")
    obj_result = NaN; return;
end
if x4 < 10 || x4 > 200
    disp("Constraint violated: 10 <= x4 <= 200")
    obj_result = NaN; return;
end

% Constraints
g1 = -x1 + 0.0193 * x3;
g2 = -x3 + 0.00954 * x3;
g3 = -pi * x3^2 * x4 - (4/3)*pi * x3^3 + 1296000;
g4 = x4 - 240;
if g1 > 0
    disp('Constraint g1 violated: -x1 + 0.0193*x3 <= 0');
    obj_result = NaN; return;
end
if g2 > 0
    disp('Constraint g2 violated: -x3 + 0.00954*x3 <= 0');
    obj_result = NaN; return;
end
if g3 > 0
    disp('Constraint g3 violated: complex volume constraint');
    obj_result = NaN; return;
end
if g4 > 0
    disp('Constraint g4 violated: x4 <= 240');
    obj_result = NaN; return;
end

% Objective function
obj_result = 0.6224*x1*x3*x4 + 1.7781*x2*x3^2 + 3.1661*x1^2*x4 + 19.84*x1^2*x3;
disp(['Objective function value: ', num2str(obj_result)]);
end
