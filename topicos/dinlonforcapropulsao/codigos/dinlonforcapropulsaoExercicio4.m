%% Dinâmica longitudinal - Força de propulsão - Exercício 4
% Escalonamento das marchas
%
%% Parâmetros

clear ; close all ; clc

% Motor
data = load('engineData.csv');

RPM = data(:,1);                    % Rotação do motor [rpm]
Te  = data(:,2);                    % Engine Torque [Nm]
Pe  = data(:,3);                    % Engine Power [kW]

% Transmissão
Nt = [3.78 2.12 1.46 1.03 0.84];    % Relação de transmissão cada marcha
Nf = 3.944;                         % Final drive ratio

% Pneu 185/60R14
aro = 14;       % [pol]
largura = 185;  % [mm]
perfil = 60;    % [%]
diametro = 25.4*aro/1000 + 2*(perfil/100*largura/1000);
raio = diametro/2;

%% Escalonamento

omegaE = RPM*2*pi/60;       % Velocidade angular do motor [rad/s]

% Geração de uma curva para cada marcha
for i=1:length(Nt)
    % Combined ratio of transmission and final drive
    Ntf = Nt(i)*Nf;
    omegaW = omegaE/Ntf;
    
    vMS(:,i) = omegaW*raio;

end

vKPH = vMS*3.6;         % Velocidade [km/h]

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'ylim',[RPM(1) RPM(end)],'xlim',[vKPH(1) vKPH(end)])
plot(vKPH(:,1),RPM,'linewidth',3)
plot(vKPH(:,2),RPM,'linewidth',3)
plot(vKPH(:,3),RPM,'linewidth',3)
plot(vKPH(:,4),RPM,'linewidth',3)
plot(vKPH(:,5),RPM,'linewidth',3)
xlabel('velocidade [km/h]')
ylabel('rotação [RPM]')
legend('1a','2a','3a','4a','5a','Location','SouthEast')
