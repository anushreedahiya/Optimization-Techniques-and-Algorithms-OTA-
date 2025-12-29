function A = ellipse_Area_OTALab3(x)

    if x < 0 || x > 2
        disp('Invalid Input');
        A = 0;
        return;
    end

    y = sqrt(1 - (x^2 / 4));
    A = 4 * x * y; 
end
