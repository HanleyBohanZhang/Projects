% Lab Test 2, Q1
% Author: 500522965

% Start from a blank workspace and screen
clear;
clc;

% Clear existing plot and reset plotting properties
clf;
clf reset;

% Generate x and y
% from -3 to 3 in increments of 0.1
x = -3:0.1:3;
y = x;

% Determine the x and y coordinates of all points on the x-y plane
[xx, yy] = meshgrid(x,y);

% Calculate the corresponding z values for each point on the x-y plane
% f(x,y) = x*e^(-x^2-y^2)
zz = xx.* exp(1).^(-xx.^2 - yy.^2);

% Plot in figure 1
figure(1);

% Plot mesh given the x, y and z values
mesh(xx,yy,zz);

% Label the axes
xlabel('x');
ylabel('y');
zlabel('z');
title('f(x,y) = x*e^(-x^2-y^2)');



