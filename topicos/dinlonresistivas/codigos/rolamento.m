clear ; close all ; clc




alpha = 1.03399904; % Close to unity
beta = -0.41081927; % Between -0.3 -0.5
a = 0.05933157;
b = 0.85526E-05;
c = 3.72314E-07;

L = 800;   % lbs
P = 34;     % Psi

V = 50; %mph

RRf = L^alpha*P^beta*(a + b*V + c*V^2)