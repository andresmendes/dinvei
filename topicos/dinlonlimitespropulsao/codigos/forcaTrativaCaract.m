%% Din�mica longitudinal - Limites de propuls�o - Limita��o de pot�ncia
% Curvas de tra��o para cada marcha
%
%% Escort

clear ; close all ; clc

%% Par�metros

% Motor
data = load('engineData.csv');

RPM = data(:,1);                    % Rota��o do motor [rpm]
Te  = data(:,2);                    % Engine Torque [Nm]
Pe  = data(:,3);                    % Engine Power [kW]

PmaxGrosskW = 88.3;                 % Max power gross [kW]

PmaxkW = max(Pe) ;                  % Max power net [kW]
PmaxW = PmaxkW*1000;                % Max power net [W]

% Transmiss�o
Nt = [3.78 2.12 1.46 1.03 0.84];    % Rela��o de transmiss�o cada marcha
Nf = 3.944;                         % Final drive ratio
eta = PmaxkW/PmaxGrosskW;           % Efici�ncia da transmiss�o

% Pneu 175/70R13
aro = 13;       % [pol]
largura = 175;  % [mm]
perfil = 70;    % [%]
raio = 25.4*aro/1000 + 2*(perfil/100*largura/1000);

%% Curvas do motor

figure
hold on ; grid on ; box on
yyaxis left
plot(RPM,Te)
ylabel('Torque [Nm]')
yyaxis right
plot(RPM,Pe)
ylabel('Pot�ncia [kW]')
xlabel('Rota��o [RPM]')

%% Tra��o caracter�stica

vel = 18:1:120;
Tr = PmaxW./vel;
omegaE = RPM*2*pi/60;   % Velocidade angular [rad/s]

% Gera��o de uma curva para cada marcha
for i=1:length(Nt)
    % Combined ratio of transmission and final drive
    Ntf = Nt(i)*Nf;
    omegaW = omegaE/Ntf;
    
    v(:,i) = omegaW*raio;
    Fx(:,i) = Te*Ntf*eta/raio;
end

figure
hold on ; grid on ; box on
plot(v(:,1),RPM)
plot(v(:,2),RPM)
plot(v(:,3),RPM)
plot(v(:,4),RPM)
plot(v(:,5),RPM)



%% For�as resistivas
% Par�metros
m = 1145;           % Massa [kg]
g = 9.81;           % Acelera��o da gravidade [m/s2]
C = 0.35;           % Drag coefficient [-]
A = 1.91;           % Area frontal [m2]
rho = 1;            % Densidade do ar [kg/m2]
theta = [0 1 2 3]*pi/180; % Inclina��o da pista [rad]
% For�as 
Rx = 0.003*m*g;      % Resist�ncia ao rolamento [N]
Da = 0.5*rho*C*A*vel.^2;
G1 = m*g*sin(theta(1));
G2 = m*g*sin(theta(2));
G3 = m*g*sin(theta(3));
G4 = m*g*sin(theta(4));

R1 = Rx + Da + G1;
R2 = Rx + Da + G2;
R3 = Rx + Da + G3;
R4 = Rx + Da + G4;


figure
hold on ; grid on ; box on
plot(v*3.6,Fx)
plot(vel*3.6,R1)
plot(vel*3.6,R2)
plot(vel*3.6,R3)
plot(vel*3.6,R4)
plot(vel*3.6,Tr,'k--')
xlabel('Velocidade [m/s]')
ylabel('For�a trativa [N]')
legend('1a','2a','3a','4a','5a','Const. Engine Power','Location','NorthEast')



