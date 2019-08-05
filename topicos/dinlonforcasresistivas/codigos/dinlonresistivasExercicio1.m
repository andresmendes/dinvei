%% Dinâmica longitudinal - Forças resisitivas - Exercício 1
% Força de resistência aerodinâmica do carro de corrida Porsche 917.
%
%% Dados
rho = 1;                    % Densidade do ar [kg/m3]
Cd  = 0.44;                 % Coeficiente de arrasto [-]
A   = 1.55;                 % Projeção da área frontal [m2]

% Vetores velocidade
vKPH = 100:1:400;            % Velocidade [km/h]
vMS  = vKPH/3.6;            % Velocidade [m/s]

%% Força aero

DA = 1/2 * rho * Cd * A * vMS.^2;

%% Potência

PDA   = DA.*vMS;            % Potência [w]
PDAhp = PDA/745.7;          % Potência [HP]

%% Resultado

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'xlim',[vKPH(1) vKPH(end)])
plot(vMS*3.6,DA,'linewidth',3)
xlabel('velocidade [km/h]')
ylabel('DA [N]')

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'xlim',[vKPH(1) vKPH(end)])
plot(vMS*3.6,PDAhp,'linewidth',3)
xlabel('velocidade [km/h]')
ylabel('PDA [HP]')
