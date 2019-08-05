%% Dinâmica longitudinal - Desempenho em rampa - Exercício 5
%
%% Dados
m = 1145;           % Massa [kg]
L = 2.532;          % Distância entre eixos [m]
b = 1.139;          % Distância [m]
c = 1.393;          % Distância [m]
h = 0.5;            % Altura do CG [m]
g = 9.81;           % Aceleração da gravidade [m/s2]

%% Dados da manobra
ax = 2;             % Aceleração longitudinal [m/s2]

%% Carga sobre o eixo dianteiro (Wf)
Wfs = m*g*c/L;

Wf = Wfs - m*ax*h/L;

disp(Wf)

%% Carga sobre o eixo dianteiro (Wr)
Wrs = m*g*b/L;

Wr = Wrs + m*ax*h/L;

disp(Wr)
