%% Din�mica longitudinal - Gillespie Cap4 Ex 1
%

clear ; close all ; clc

%% Par�metros
rho = 1.07;             % Densidade do ar [kg/m3]
Cd = 0.65;              % Coeficiente de arrasto [-]
A = 10.0335;            % Proje��o da �rea frontal [m2]
v = (100:1:200)/3.6;    % Velocidade [m/s]
v = 29.9517;            %m/s

%% For�a aero

DA = 1/2 * rho * Cd * A * v.^2;

%% Pot�ncia

PDA = DA.*v;        % Pot�ncia [w]
PDAhp = PDA/745.7;  % Pot�ncia [HP]

%% Resultado

figure
hold on ; grid on ; box on
plot(v*3.6,DA)
xlabel('velocidade [km/h]')
ylabel('DA [N]')

figure
hold on ; grid on ; box on
plot(v*3.6,PDAhp)
xlabel('velocidade [km/h]')
ylabel('PDA [HP]')
