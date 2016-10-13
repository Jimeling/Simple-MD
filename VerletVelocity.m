function [VV F] = VerletVelocity(A,L,D,R,V,M,ang,dt,e,s)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
VV = V;
F = zeros(D,L);
for j = 1:L
    for i = 1:L
        if j~=i
        F(1,j) = F(1,j) + sind(ang{j}(i))*(4*e*(12*(s^12/R{j}(i)^14)-6*(s^6/R{j}(i)^8)));
        F(2,j) = F(2,j) + cosd(ang{j}(i))*(4*e*(12*(s^12/R{j}(i)^14)-6*(s^6/R{j}(i)^8)));
        end
    end
    VV(1,j) = VV(1,j) + F(1,j)/M/2*dt;
    VV(2,j) = VV(2,j) + F(2,j)/M/2*dt;
end
end

