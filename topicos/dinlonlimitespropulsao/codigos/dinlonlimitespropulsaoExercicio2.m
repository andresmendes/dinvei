%% Din�mica longitudinal - Limites de propuls�o - Exerc�cio 2
% Curvas de tra��o para cada marcha.
%
%% Par�metros

clear ; close all ; clc

% Motor
data = load('engineData.csv');

RPM = data(:,1);                    % Rota��o do motor [rpm]
Te  = data(:,2);                    % Engine Torque [Nm]
Pe  = data(:,3);                    % Engine Power [kW]

% % Resolu��o reduzida para tabela manual
% RPM = data(1:10:end,1);                    % Rota��o do motor [rpm]
% Te  = data(1:10:end,2);                    % Engine Torque [Nm]
% Pe  = data(1:10:end,3);                    % Engine Power [kW]

% Net Power
% i.e., j� descontando acess�rios, sem descontar efici�ncia da transmiss�o.
PmaxkW = max(Pe) ;                  % Max power net [kW]
PmaxW = PmaxkW*1000;                % Max power net [W]

% Transmiss�o
Nt = [3.78 2.12 1.46 1.03 0.84];    % Rela��o de transmiss�o cada marcha
Nf = 3.944;                         % Final drive ratio
% A curva de pot�ncia j� � na roda.
eta = 0.96;           % Efici�ncia da transmiss�o (estimado)

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
ylabel('Pot�ncia [kW]')
xlabel('Rota��o [RPM]')

%% Curvas de tra��o

omegaE = RPM*2*pi/60;       % Velocidade angular do motor [rad/s]

% Gera��o de uma curva para cada marcha
for i=1:length(Nt)
    % Combined ratio of transmission and final drive
    Ntf = Nt(i)*Nf;
    omegaW = omegaE/Ntf;
    
    vMS(:,i) = omegaW*raio;
    Fx(:,i) = Te*Ntf*eta/raio;
end

% Velocidade para as for�as de propuls�o
vKPH = vMS*3.6;         % Faixa de velocidade [km/h]

% Velocidade para a for�a de pot�ncia m�xima
vTr = 32:1:400;         % Velocidade para a curva de pot�ncia m�xima [km/h]
vTrMS = vTr/3.6;        % Velocidade para a curva de pot�ncia m�xima [m/s]
Tr = PmaxW./vTrMS;      % Tra��o com pot�ncia m�xima [N]

%% Resultado

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'ylim',[0 max(Tr)],'xlim',[vKPH(1,1) vKPH(end,end)])
plot(vKPH,Fx,'linewidth',3)
plot(vTr,Tr,'k--')
xlabel('Velocidade [km/h]')
ylabel('For�a trativa [N]')
legend('1a','2a','3a','4a','5a','Pot. Const.','Location','NorthEast')



