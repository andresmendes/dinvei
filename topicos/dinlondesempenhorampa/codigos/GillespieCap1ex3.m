%% Gillespie

clear ; close all ; clc

mu = 0.3;           % Coeficiente de atrito [-]

%% Dados do carro
Wf = 1520;          % Peso sobre o eixo dianteiro [lb]
Wr = 1150;          % Peso sobre o eixo traseiro [lb]
h1 = 24.5;          % Altura do CG do carro [in]
h2 = 14;            % Altura do engate [in]
d = 23;             % Posição do engate [in]
L = 120;            % Distância entre eixos [in]

%% Dados do reboque
WbEixo = 1200;      % Peso sobre o eixo do reboque [lb]
Fzb = 250;          % Carga sobre o engate [lb];
Lt = 110;           % Distância do eixo ao engate [in]
h3 = 35;            % Altura do CG do reboque [in]

%% Cálculos
W = Wf + Wr;        % Peso total do carro [lb]
Wb = WbEixo + Fzb;  % Peso total do reboque [lb]
zeta = Wb/W;        % Razão dos pesos reboque/carro
% Posição do CG do carro
b = Wr/W*L;
c = Wf/W*L;
% Posição do CG do reboque
e = WbEixo/Wb*Lt;
f = Fzb/Wb*Lt;

%% Gradeability Front Wheel Drive - FWD

% [rad]
thetaFWD = mu*(c/L - zeta*d/L*f/Lt)/(1 + mu*h1/L + zeta*(1 + mu*h2/L + mu*d/L*(h2-h3)/Lt));
% [deg]
disp(thetaFWD*180/pi)

%% Gradeability Rear Wheel Drive - RWD

% [rad]
thetaRWD = mu*(b/L + zeta*(L+d)/L*f/Lt)/(1 - mu*h1/L + zeta*(1 - mu*h2/L - mu*(L+d)/L*(h2-h3)/Lt));
% [deg]
disp(thetaRWD*180/pi)

%% Gradeability 4 (four) Wheel Drive - 4WD

% [rad]
theta4WD = mu*1/(1+zeta);
% [deg]
disp(theta4WD*180/pi)
