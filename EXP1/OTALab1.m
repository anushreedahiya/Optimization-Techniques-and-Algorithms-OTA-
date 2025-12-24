% 1. Matrix 5*6
a = [1 2 3 4 5; 14 15 16 17 23; 21 22 23 24 25; 54 55 56 57 73; 11 32 13 44 25; 84 19 13 10 21]
% Sum of all rows
Sr=sum(a,2)
% sum of all cloumn
Sc=sum(a,1)
% sum of all elements
S=sum(a,"all")

% 2. switch case to print grades
prompt = "Enter your marks: ";
num = input(prompt);
if num >= 80 && num <= 100
    grade_case = 1;
elseif num >= 60 && num <= 79
    grade_case = 2;
elseif num >= 40 && num <= 59
    grade_case = 3;
elseif num >= 0 && num <= 39
    grade_case = 4;
else
    grade_case = 0; % invalid
end

switch grade_case
    case 1
        fprintf("A\n");
    case 2
        fprintf("B\n");
    case 3
        fprintf("C\n");
    case 4
        fprintf("F\n");
    otherwise
        fprintf("Invalid\n");
end

% 3. Power function
[x, y] = power_func_OTALab1(2, 3);
fprintf("a^b is: \n")
disp(x); 
fprintf("b^a is: \n")
disp(y);
