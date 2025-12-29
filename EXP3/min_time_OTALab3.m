function minT = min_time_OTALab3(x)

if (x<=0 || x>=66)
    disp("Invalid constraint");
    minT=0;
    return;
else
    runTime = x / 88;
    swimDist = sqrt((66 - x).^2 + 22^2); 
    swimTime = swimDist / 33;
    % Total time
    minT = runTime + swimTime;

end
