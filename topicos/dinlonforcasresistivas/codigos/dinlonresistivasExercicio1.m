%% Din�mica longitudinal - For�as resisitivas - Exerc�cio 1
% For�a de resist�ncia aerodin�mica do carro de corrida Porsche 917.
%
%% Dados
rho = 1;                    % Densidade do ar [kg/m3]
Cd  = 0.44;                 % Coeficiente de arrasto [-]
A   = 1.55;                 % Proje��o da �rea frontal [m2]

% Vetores velocidade
vKPH = 100:1:400;            % Velocidade [km/h]
vMS  = vKPH/3.6;            % Velocidade [m/s]

%% For�a aero

DA = 1/2 * rho * Cd * A * vMS.^2;

%% Pot�ncia

PDA   = DA.*vMS;            % Pot�ncia [w]
PDAhp = PDA/745.7;          % Pot�ncia [HP]

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
