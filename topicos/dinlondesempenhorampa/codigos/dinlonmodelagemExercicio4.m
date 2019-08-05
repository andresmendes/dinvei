%% Dinâmica longitudinal - Desempenho em rampa - Exercício 4
%
%% Dados
m = 1145;           % Massa [kg]
L = 2.532;          % Distância entre eixos [m]
b = 1.139;          % Distância [m]
c = 1.393;          % Distância [m]
g = 9.81;           % Aceleração da gravidade [m/s2]

%% Carga sobre o eixo dianteiro (Wfs)
Wfs = m*g*c/L;
disp(Wfs)

%% Carga sobre o eixo dianteiro (Wrs)
Wrs = m*g*b/L;
disp(Wrs)
