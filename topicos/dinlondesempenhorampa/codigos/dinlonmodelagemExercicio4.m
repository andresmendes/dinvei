%% Din�mica longitudinal - Desempenho em rampa - Exerc�cio 4
%
%% Dados
m = 1145;           % Massa [kg]
L = 2.532;          % Dist�ncia entre eixos [m]
b = 1.139;          % Dist�ncia [m]
c = 1.393;          % Dist�ncia [m]
g = 9.81;           % Acelera��o da gravidade [m/s2]

%% Carga sobre o eixo dianteiro (Wfs)
Wfs = m*g*c/L;
disp(Wfs)

%% Carga sobre o eixo dianteiro (Wrs)
Wrs = m*g*b/L;
disp(Wrs)
