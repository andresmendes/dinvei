%% Dinâmica longitudinal - Limites de propulsão - Exercício 3
% Curvas de tração para cada marcha com forças resistivas.
%
%% Parâmetros

clear ; close all ; clc

% Motor
data = load('engineData.csv');

RPM = data(:,1);                    % Rotação do motor [rpm]
Te  = data(:,2);                    % Engine Torque [Nm]
Pe  = data(:,3);                    % Engine Power [kW]

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

%% Forças resistivas

% Velocidade para a força de potência máxima
vResist = 10:1:400;         % Velocidade para a curva de potência máxima [km/h]
vResistMS = vResist/3.6;        % Velocidade para a curva de potência máxima [m/s]

% Parâmetros
m = 1145;              % Massa [kg]
g = 9.81;           % Aceleração da gravidade [m/s2]
C = 0.35;           % Drag coefficient [-]
A = 1.91;           % Area frontal [m2]
rho = 1;            % Densidade do ar [kg/m2]
inc = [0 5 9];      % Inclinação da pista [%]
theta = atan(inc/100); % Inclinação da pista [rad]
% Forças 
W = m*g;        % Massa do carro [kg]
Ch = 1;
vMPH = vResist/1.609;          % Velocidade [mph]

% Modelo 1 - coeficientes para 28 psi
f0 = 0.012;
fs = 0.007;
fr = f0 + 3.24*fs*(vMPH/100).^2.5;
% Modelo 2
% fr = (0.0041 + 0.000041*vMPH)*Ch;

Rx = fr*W;      % [N]

Da = 0.5*rho*C*A*vResistMS.^2;
G1 = m*g*sin(theta(1));
G2 = m*g*sin(theta(2));
G3 = m*g*sin(theta(3));

R1 = Rx + Da + G1;
R2 = Rx + Da + G2;
R3 = Rx + Da + G3;

%% Resultado

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'ylim',[0 max(Tr)],'xlim',[vKPH(1,1) vKPH(end,end)])
plot(vKPH,Fx,'linewidth',3)
plot(vResist,R1,'linewidth',3)
plot(vResist,R2,'linewidth',3)
plot(vResist,R3,'linewidth',3)
plot(vTr,Tr,'k--')
xlabel('Velocidade [km/h]')
ylabel('Força trativa [N]')
legend('1a','2a','3a','4a','5a','th=0','th=5%','th=9%','Pot. Const.','Location','NorthEast')



