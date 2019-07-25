%% Dinâmica longitudinal - Limites de propulsão - Exercício 2
% Curvas de tração para cada marcha.
%
%% Parâmetros

clear ; close all ; clc

% Motor
data = load('engineData.csv');

RPM = data(:,1);                    % Rotação do motor [rpm]
Te  = data(:,2);                    % Engine Torque [Nm]
Pe  = data(:,3);                    % Engine Power [kW]

% % Resolução reduzida para tabela manual
% RPM = data(1:10:end,1);                    % Rotação do motor [rpm]
% Te  = data(1:10:end,2);                    % Engine Torque [Nm]
% Pe  = data(1:10:end,3);                    % Engine Power [kW]

% Net Power
% i.e., já descontando acessórios, sem descontar eficiência da transmissão.
PmaxkW = max(Pe) ;                  % Max power net [kW]
PmaxW = PmaxkW*1000;                % Max power net [W]

% Transmissão
Nt = [3.78 2.12 1.46 1.03 0.84];    % Relação de transmissão cada marcha
Nf = 3.944;                         % Final drive ratio
% A curva de potência já é na roda.
eta = 0.96;           % Eficiência da transmissão (estimado)

% Pneu 185/60R14
aro = 14;       % [pol]
largura = 185;  % [mm]
perfil = 60;    % [%]
diametro = 25.4*aro/1000 + 2*(perfil/100*largura/1000);
raio = diametro/2;

%% Curvas do motor

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'ylim',[0 1.1*max(Te)],'xlim',[RPM(1,1) RPM(end,end)])
yyaxis left
plot(RPM,Te,'linewidth',3)
ylabel('Torque [Nm]')
yyaxis right
plot(RPM,Pe,'linewidth',3)
ylabel('Potência [kW]')
xlabel('Rotação [RPM]')

%% Curvas de tração

omegaE = RPM*2*pi/60;       % Velocidade angular do motor [rad/s]

% Geração de uma curva para cada marcha
for i=1:length(Nt)
    % Combined ratio of transmission and final drive
    Ntf = Nt(i)*Nf;
    omegaW = omegaE/Ntf;
    
    vMS(:,i) = omegaW*raio;
    Fx(:,i) = Te*Ntf*eta/raio;
end

% Velocidade para as forças de propulsão
vKPH = vMS*3.6;         % Faixa de velocidade [km/h]

% Velocidade para a força de potência máxima
vTr = 32:1:400;         % Velocidade para a curva de potência máxima [km/h]
vTrMS = vTr/3.6;        % Velocidade para a curva de potência máxima [m/s]
Tr = PmaxW./vTrMS;      % Tração com potência máxima [N]

%% Resultado

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'ylim',[0 max(Tr)],'xlim',[vKPH(1,1) vKPH(end,end)])
plot(vKPH,Fx,'linewidth',3)
plot(vTr,Tr,'k--')
xlabel('Velocidade [km/h]')
ylabel('Força trativa [N]')
legend('1a','2a','3a','4a','5a','Pot. Const.','Location','NorthEast')



