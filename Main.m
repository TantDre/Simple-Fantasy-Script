clear 
clc

% Input
run Data_2020.m
budget = 100;

% Magic
combs = nchoosek(drivers(:,1),5);
price = teams(:,3)' + drivers(combs(:,1), 3)+drivers(combs(:,2), 3)+drivers(combs(:,3), 3)+drivers(combs(:,4), 3)+drivers(combs(:,5), 3);
points =teams(:,2)' +drivers(combs(:,1), 2)+drivers(combs(:,2), 2)+drivers(combs(:,3), 2)+drivers(combs(:,4), 2)+drivers(combs(:,5), 2);

ok_points = points.*(price <= budget);
max_points = max(max(ok_points));
[i,j] = ind2sub(size(ok_points),find(ok_points==max_points));

% Sort
[~, order] = sort(drivers(combs(i,:)', 2), "descend");
lineup = combs(i,:);
lineup = lineup(order);

% Results
team = num2team(j);
driver = num2drv(lineup);

% Print
disp("  Total points: " + max_points)
disp("          Team: " + team)
disp("   Mega driver: " + driver(1))
disp("  Turbo driver: " + driver(2))
disp("        Driver: " + driver(3))
disp("        Driver: " + driver(4))
disp("        Driver: " + driver(5))
