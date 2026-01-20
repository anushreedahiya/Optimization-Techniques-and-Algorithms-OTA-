function [Cha] = ChaosSeq(n, type)
    
    %intial seed
    x = ones(1, n);
    x(1) = rand; 

    switch type
        case 'logistic'
            for i = 1:n-1
                x(i+1) = 4*x(i)*(1-x(i));
            end

        case 'circle'
            a=0.5; b=0.2; x(1)=0.55;
            for i=1:n-1
                x(i+1) = mod((x(i)+b-(a-2*pi)*sin(2*pi*x(i))),1);
            end

        case 'kent'
            m = rand;
            for i=1:n-1
                if x(i)<=m
                    x(i+1)=x(i)/m;
                else
                    x(i+1)=(1-x(i))/(1-m);
                end
            end

        case 'piecewise'
            for i=1:n-1
                if x(i)<=0.7
                    x(i+1)=x(i)/0.7;
                else
                    x(i+1)=(1-x(i))/(1-0.7);
                end
            end

        case 'sine'
            for i=1:n-1
                x(i+1)=sin(pi*x(i));
            end

        case 'sinusoidal'
            x(1)=0.55;
            for i=1:n-1
                x(i+1)=2.3*x(i)^2*sin(pi*x(i));
            end
    end
    Cha = x;
end
