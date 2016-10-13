function [X,Y,k] = Collison(A,R,L,k,X,Y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for i = 1:L
   CurrentA = i;
   CollisonA = find(R{i} <= 0.05e-9);
    if isempty(CollisonA) ~= 1
      %disp('crash')
      for p = 1:length(CollisonA)
      X(k) = (A(1,i)+ A(1,CollisonA(p)))/2;
      Y(k) = (A(2,i)+ A(2,CollisonA(p)))/2;
      k = k+1;
      end
end


end

