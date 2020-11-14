clear 
clc

% Input
run Data.m
budget = 100;

% Magic
combs = nchoosek(drivers(:,1),5);
price = teams(:,3)' + drivers(combs(:,1), 3)+drivers(combs(:,2), 3)+drivers(combs(:,3), 3)+drivers(combs(:,4), 3)+drivers(combs(:,5), 3);
points =teams(:,2)' +drivers(combs(:,1), 2)+drivers(combs(:,2), 2)+drivers(combs(:,3), 2)+drivers(combs(:,4), 2)+drivers(combs(:,5), 2);

ok_points = points.*(price <= budget);
max_points = max(max(ok_points))
[i,j] = ind2sub(size(ok_points),find(ok_points==max_points));

% Results
team = num2team(j)
driver = num2drv(combs(i,:))
