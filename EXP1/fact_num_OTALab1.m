% factorial of a number
function fact_num_OTALab1
    num=input("Enter a non negative integer: ");

    if num < 0
        error("Invalid Input")
    elseif num==0
        fact_result = 1;
    else
        fact_result = 1;
        for i =1:num
            fact_result = fact_result * i;
        end
    end
    fprintf("Factorial of %d is: %d", num, fact_result);
end

