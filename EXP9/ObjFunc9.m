function y = ObjFunc9(fnumber, x)
    switch fnumber
        case 0
            y = sum(x.^2); 
        case 1
            y = 25 + sum(round(x)); 
        case 2
            y = sum((floor(x+0.5)).^2);
        case 3
            y = sum(x.^2);
        case 4
            y = sum((1:numel(x)) .* (x.^2));
        otherwise
            error('Unknown function number');
    end
end
