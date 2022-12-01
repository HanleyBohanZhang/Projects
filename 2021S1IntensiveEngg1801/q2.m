% Lab Test Q2
% Author: 500522965

% Start from a blank workspace and screen
clc;
clear;

% Initialise the coordinates of 3 given points 
% which are (-6,0),(1,2),(3,12)
x = [-6,1,3];
y = [0,2,12];

% Calculate the coefficients with degree 2,
% the equation in generate is y = ax^2 + bx + c
coefs = polyfit(x,y,2);

% Print each coefs in 2 decimal places
fprintf('a = %.2f\n', coefs(1));
fprintf('b = %.2f\n', coefs(2));
fprintf('c = %.2f\n', coefs(3));