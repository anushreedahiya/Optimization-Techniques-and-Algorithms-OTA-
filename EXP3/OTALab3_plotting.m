% 1. rectangular area maximize
% x = linspace(0, 50, 500);   % start value, end value, and spacing
% y = max_area_OTALab3(x);
% p(:,1) = x;  % all rows value(:) in column 1 are the value of x
% p(:,2) = y;

% 2. volume maximize
% x = linspace(0, 12, 500); 
% y = arrayfun(@max_volume_OTALab3, x);
% % Plotting the volume
% plot(x, y, 'LineWidth', 2);
% xlabel('x (inches)');
% ylabel('Volume (cubic inches)');
% title('Box Volume vs x');
% grid on;
% p(:,1) = x(:); 
% p(:,2) = y(:);

% 3. min time
% x = linspace(0.1, 65.9, 500);
% T = arrayfun(@min_time_OTALab3, x);
% plot(x, T, 'LineWidth', 2);
% xlabel('x (miles run)');
% ylabel('Total Time (hours)');
% title('Travel Time to Island vs Distance Run');
% grid on;
% [minTime, idx] = min(T);
% fprintf('Minimum time: %.4f hours at x = %.2f miles run\n', minTime, x(idx));

% 4. Revenue Calculate
% p = linspace(50, 200, 500);
% R = arrayfun(@rentalRevenue_OTALab3, p);
% plot(p, R, 'LineWidth', 2);
% xlabel('Price per Day ($)');
% ylabel('Revenue ($)');
% title('Revenue vs Price');
% grid on;
% 
% [maxRev, idx] = max(R);
% fprintf('Maximum revenue is $%.2f at price = $%.2f/day\n', maxRev, p(idx));

% 5. Maximize Area of Rectangle in an Ellipse
x = linspace(0, 2, 500);
A = arrayfun(@ellipse_Area_OTALab3, x); 
[maxArea, idx] = max(A);
fprintf('Maximum area = %.2f at x = %.2f\n', maxArea, x(idx));

