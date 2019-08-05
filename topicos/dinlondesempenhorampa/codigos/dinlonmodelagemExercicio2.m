%% Dinâmica longitudinal - Desempenho em rampa - Exercício 2 (Revisão)
%
%% Dados
T = 180;            % Força de tração [N]
r = 0.5;            % Raio do disco [m]
m = 15;             % Massa da caixa [kg]

%% Momento da força [Nm]
MG = T*r;
disp(MG)

%% Aceleração angular [rad/s2]
Iz = 1/2*m*r^2;     % Momento de inércia de um disco homogêneo [kgm2]
alpha = MG/Iz;
disp(alpha)
