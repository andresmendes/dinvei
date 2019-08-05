%% Din�mica longitudinal - Desempenho em rampa - Exerc�cio 2 (Revis�o)
%
%% Dados
T = 180;            % For�a de tra��o [N]
r = 0.5;            % Raio do disco [m]
m = 15;             % Massa da caixa [kg]

%% Momento da for�a [Nm]
MG = T*r;
disp(MG)

%% Acelera��o angular [rad/s2]
Iz = 1/2*m*r^2;     % Momento de in�rcia de um disco homog�neo [kgm2]
alpha = MG/Iz;
disp(alpha)
