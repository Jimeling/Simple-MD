function [A] = boundary(A)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
X = A(1,:);
Y = A(2,:);

x = find(abs(X) > 2e-9);
y = find(abs(Y) > 2e-9);
%i = 1;

if isempty(x) ~= 1
for i = 1:length(x)
    if X(x(i)) > 0
        %A(1,x(i)) = A(1,x(i)) - 4e-9;
        %A(2,x(i)) = A(2,x(i)) - 4e-9;
        A(1,x(i)) = -2e-9;
    else
        %A(1,x(i)) = A(1,x(i)) + 4e-9;
        %A(2,x(i)) = A(2,x(i)) + 4e-9;
        A(1,x(i)) = 2e-9;
    end
end
end
if isempty(y) ~= 1
for i = 1:length(y)
    if Y(y(i)) > 0
        %A(1,y(i)) = A(1,y(i)) - 4e-9;
        %A(2,y(i)) = A(2,y(i)) - 4e-9;
        A(2,y(i)) = -2e-9;
    else
        %A(1,y(i)) = A(1,y(i)) + 4e-9;
        %A(2,y(i)) = A(2,y(i)) + 4e-9;
        A(2,y(i)) = 2e-9;
    end    
end
end
end

