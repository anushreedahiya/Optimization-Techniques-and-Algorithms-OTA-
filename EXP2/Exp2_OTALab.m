% 1. Generate random number between 1 and 100 and printng odd or even
% a = 1+100*rand(2,5)
num = randi([1, 100]);
disp(['Random Number: ', num2str(num)]);   % we can't directly print a number with a string therefore used [] and num2str operator
if mod(num,2) == 0
    disp('Number generated is even.');
else
    disp('Number generated is odd.');
end


% 2. Number divisible by 5
% Method 1
% a = input("Enter a number: ");
% if mod(a,5)==0
%     disp('Number is divisible by 5');
% else
%     disp("Number not divisible by 5");
% end

% METHOD 2
a = input("Enter a number: ");
I = rem(a, 5)  % store the remainder after dividing number by 5
if I == 0
    disp('Number is divisible by 5');
else
    disp('Number is not divisible by 5');
end


% 3. calling arr function from another file
% n = 5;
% d = 3;
% LB = 10;
% UB = 50;
% array = generate_randomnum_LAB2(n, d, LB, UB)


% 4. Repeat ques3 with different values given already and plotting a 2D
% surface of the same
n = 10;
d = 2;
LB = -100;
UB = 100;
random_array = generate_randomnum_LAB2(n, d, LB, UB);
disp('Random Array:');
disp(random_array);

figure;
scatter(random_array(:,1), random_array(:,2), 'filled');
xlabel('Dimension 1');
ylabel('Dimension 2');
title('2D Plot of Random Points');
grid on; 

% 5. calling the function that finds the capacity of a gas production facility
c = capacity_gas_production_OTALab2(5, 10);
disp(['Capacity: ', num2str(c)]);


% 6. calling function
objective_func_calc_OTALab2(50, 60, 100, 150)
% incorrect input
% objective_func_calc_OTALab2(100, 60, 100, 150)


