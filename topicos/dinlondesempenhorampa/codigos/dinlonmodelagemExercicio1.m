%% Din�mica longitudinal - Desempenho em rampa - Exerc�cio 1 (Revis�o)
%
%% Dados
P = 400;            % For�a de tra��o [N]
m = 50;             % Massa da caixa [kg]
g = 9.81;           % Acelera��o da gravidade [m/s2]
theta = 30*pi/180;  % �ngulo de tra��o [rad]
mu = 0.3;           % Coeficiente de atrito [-]

%% For�a normal [N]
N = m*g - P*sin(theta);
disp(N)

%% Acelera��o [m/s2]
ax = (P*cos(theta)-mu*N)/m;
disp(ax)
