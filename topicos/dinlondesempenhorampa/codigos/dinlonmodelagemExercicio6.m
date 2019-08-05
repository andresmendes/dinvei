%% Din�mica longitudinal - Modelagem - Exerc�cio 6

%% Dados do Escort
m = 1145;           % Massa [kg]
L = 2.532;          % Dist�ncia entre eixos [m]
b = 1.139;          % Dist�ncia [m]
c = 1.393;          % Dist�ncia [m]
h = 0.5;            % Altura do CG [m]
g = 9.81;           % Acelera��o da gravidade [m/s2]

%% Dados da manobra
slope = 10;          % Road slope [%]
theta = atan(slope/100); % Road angle [rad]

%% Carga sobre o eixo dianteiro (Wf)
Wfs = m*g*c/L;

Wf = Wfs - m*g*h/L*theta;

disp(Wf)

%% Carga sobre o eixo dianteiro (Wr)
Wrs = m*g*b/L;

Wr = Wrs + m*g*h/L*theta;

disp(Wr)
