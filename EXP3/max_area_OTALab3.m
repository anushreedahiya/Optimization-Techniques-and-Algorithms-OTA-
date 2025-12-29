function maxA = max_area_OTALab3(x)

% checking constraints
if (x<0)
    disp("Constraint Violated");
    maxA=0;
elseif (x>50)
    disp("Constraint Violated");
    maxA=0;
else
    maxA = 100*x-2*x.*x;   % .* tells that here is element-wise multiplication
end
