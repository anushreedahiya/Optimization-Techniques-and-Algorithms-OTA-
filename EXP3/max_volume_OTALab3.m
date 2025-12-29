% volume = lbh now, let height=x; l=36-2x; b=24-2x
function maxV = max_volume_OTALab3(x)

if x<0
    disp("Violated Constraint");
    maxV=0;
elseif x>12
    disp("Violated Constraint");
    maxV=0;
else
    maxV = 4*x.*x.*x - 120*x.*x +864*x
end
