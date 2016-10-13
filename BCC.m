%% Create Structure
clear all; close all; clc;

%% Physical constants
Avg = 6.022e23;

%% Material constant
e = 1.654e-21; % [J]
S = 3.405e-10; % [m]
M1 = 39.948/Avg; % [gram]

%%
D = 2; % 2 Dimensions
L = 5; % Number of particles
dt = 1e-12; % Timestep, undecided unit for now
t = dt*100; % Total time

A = zeros(D,L); % Position matrix
B = zeros(D,L); % Speed and angle matrix
V = zeros(D,L); % Speed in x and y direction

for i = 1:L
   for j = 1:D
      A(j,i) = -2 + 4*rand;
   end
   B(1,i) = -1+2*rand;
   B(2,i) = floor(360-360*rand);
   V(1,i) = B(1,i)*sind(B(2,i));
   V(2,i) = B(1,i)*cosd(B(2,i));
   %leg{i} = sprintf('Particle %G',i);
end


A = A*1e-10; % [Å]
V = V*1e-10; % [Å]

[R,ang] = Distance(A,L,D);
k = 1;
X = nan; Y = nan;

[X,Y,k] = Collison(A,R,L,k,X,Y);
[VV F] = VerletVelocity(A,L,D,R,V,M1,ang,dt,e,S);
% VV = VV*1e-43;
V = V+VV;

figure('Units','normalized','OuterPosition',[0.5 0.02 0.5 0.5]);
scatter(A(1,:),A(2,:)); xlim([-1e-8 1e-8]); ylim([-1e-8 1e-8])
%pause(5)

for teller = 1:t/dt
    XY{teller} = A; 
    A = A + V*dt;
    R = Distance(A,L,D);
    %k = 0;
    [X,Y,k] = Collison(A,R,L,k,X,Y);
    A = boundary(A);
    scatter(A(1,:),A(2,:)); xlim([-1e-8 1e-8]); ylim([-1e-8 1e-8])
    hold on; scatter(X,Y,'x'); hold off
    title(sprintf('Time %G [s]',teller*dt))
    pause(0.05)
    [VV F] = VerletVelocity(A,L,D,R,V,M1,ang,dt,e,S);
%     VV = VV*1e-43;
    V = V+VV;
end

scatter(A(1,:),A(2,:)); xlim([-1e-8 1e-8]); ylim([-1e-8 1e-8]);
hold on; scatter(X,Y,'x'); hold off
title(sprintf('Time %G [s]',teller*dt))
%legend(leg);


