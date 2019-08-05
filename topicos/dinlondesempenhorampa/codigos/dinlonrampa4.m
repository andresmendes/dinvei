%% dinlonrampa3

clear ; close all ; clc

%% Dados do enunciado
syms Mf Mr
syms Lc h1
syms mu

g = 9.81;           % Aceleração da gravidade [m/s2]

%% Dados do carro
% Wf = 1520;          % Peso sobre o eixo dianteiro [N]
% Wr = 1150;          % Peso sobre o eixo traseiro [lb]
Wf = Mf*g;          % Peso sobre o eixo dianteiro [N]
Wr = Mr*g;          % Peso sobre o eixo traseiro [N]
% h1 = 24.5;          % Altura do CG do carro [in]
% h2 = 14;            % Altura do engate [in]
% d = 23;             % Posição do engate [in]
% L = 120;            % Distância entre eixos [in]

%% Pre cálculos
W = Wf + Wr;        % Peso total do carro [lb]
zeta = 0;        % Razão dos pesos reboque/carro
% Posição do CG do carro
b = Wr/W*Lc;
c = Wf/W*Lc;

%% Valores da questão para verificação
muVal = 0.5;
MfVal=	1207;
MrVal=	1171;
h1Val=	0.97;
LcVal=	3.28;

%% Gradeability Front Wheel Drive - FWD

% [rad]
thetaFWD = mu*(c/Lc)/(1 + mu*h1/Lc);
% [deg]
disp(simplify(thetaFWD*180/pi))

thetaFWDval = double(subs(thetaFWD*180/pi,[mu Mf Mr h1 Lc],[muVal MfVal MrVal h1Val LcVal]));
disp(thetaFWDval)

%% Gradeability Rear Wheel Drive - RWD

% [rad]
thetaRWD = mu*(b/Lc)/(1 - mu*h1/Lc);
% [deg]
disp(simplify(thetaRWD*180/pi))

thetaRWDval = double(subs(thetaRWD*180/pi,[mu Mf Mr h1 Lc],[muVal MfVal MrVal h1Val LcVal]));
disp(thetaRWDval)

%% Gradeability 4 (four) Wheel Drive - 4WD

% [rad]
theta4WD = mu*1/(1+zeta);
% [deg]
disp(simplify(theta4WD*180/pi))

theta4WDval = double(subs(theta4WD*180/pi,[mu Mf Mr h1 Lc],[muVal MfVal MrVal h1Val LcVal]));
disp(theta4WDval)

