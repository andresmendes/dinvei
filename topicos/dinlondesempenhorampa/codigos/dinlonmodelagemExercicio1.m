%% Dinâmica longitudinal - Desempenho em rampa - Exercício 1 (Revisão)
%
%% Dados
P = 400;            % Força de tração [N]
m = 50;             % Massa da caixa [kg]
g = 9.81;           % Aceleração da gravidade [m/s2]
theta = 30*pi/180;  % Ângulo de tração [rad]
mu = 0.3;           % Coeficiente de atrito [-]

%% Força normal [N]
N = m*g - P*sin(theta);
disp(N)

%% Aceleração [m/s2]
ax = (P*cos(theta)-mu*N)/m;
disp(ax)
