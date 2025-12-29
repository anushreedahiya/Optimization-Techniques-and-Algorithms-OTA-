function R = rentalRevenue(p)
    if p < 50 || p > 200
        disp('Invalid Range');
        R = 0;
        return;
    end

    R = p * (1000 - 5*p); 
end
