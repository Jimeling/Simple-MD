function [R,ang] = Distance(A,L,D)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
X = A(1,:);
Y = A(2,:);
for j = 1:L
for i = 1:L
    if j~=i
    R{j}(i) = sqrt(((X(j)-X(i))^2 + (Y(j)-Y(i))^2));
    ang{j}(i) = 360/pi*atan2(X(j)*Y(i)-Y(j)*X(i),X(j)*X(i)+Y(j)*Y(i));
    else
    R{j}(i) = nan;
    ang{j}(i) = nan;
    end
end
end
end

