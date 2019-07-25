%% Dinâmica longitudinal - Forças resisitivas - Exercício 2
% Força de resistência aerodinâmica do caminhão.
%
% Fonte: Gillespie Cap4Ex1.
%
%% Parâmetros
rho = 1;                    % Densidade do ar [kg/m3]
Cd  = 0.65;                 % Coeficiente de arrasto [-]
A   = 10;                   % Projeção da área frontal [m2]

% Vetores velocidade
vKPH = 80:1:120;            % Velocidade [km/h]
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
% print(gcf,'-dpng','dinlonresistivasExercicio2Forca.png')

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'xlim',[vKPH(1) vKPH(end)])
plot(vMS*3.6,PDAhp,'linewidth',3)
xlabel('velocidade [km/h]')
ylabel('PDA [HP]')
% print(gcf,'-dpng','dinlonresistivasExercicio2Potencia.png')
