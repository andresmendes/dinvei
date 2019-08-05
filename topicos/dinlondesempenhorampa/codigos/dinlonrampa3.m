%% dinlonrampa3

clear ; close all ; clc

%% Dados do enunciado
syms Mf Mr Mt Mzb
syms h1 h2 d Lc
syms Fzb Lt h3
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

%% Dados do reboque
% WbEixo = 1200;      % Peso sobre o eixo do reboque [lb]
Wt = Mt*g;      % Peso sobre o eixo do reboque [lb]
Fzb = Mzb*g;          % Carga sobre o engate [lb;
% Lt = 110;           % Distância do eixo ao engate [in]
% h3 = 35;            % Altura do CG do reboque [in]

%% Pre cálculos
W = Wf + Wr;        % Peso total do carro [lb]
Wb = Wt + Fzb;  % Peso total do reboque [lb]
zeta = Wb/W;        % Razão dos pesos reboque/carro
% Posição do CG do carro
b = Wr/W*Lc;
c = Wf/W*Lc;
% Posição do CG do reboque
e = Wt/Wb*Lt;
f = Fzb/Wb*Lt;

%% Valores da questão para verificação
muVal = 0.34;
MfVal=	1346;
MrVal=	1123;
MtVal=	1256;
MzbVal= 429;
h1Val=	0.62;
h2Val=	0.31;
h3Val=	0.84;
dVal=	0.44;
LcVal=	2.69;
LtVal=	4.89;

%% Gradeability Front Wheel Drive - FWD

% [rad]
thetaFWD = mu*(c/Lc - zeta*d/Lc*f/Lt)/(1 + mu*h1/Lc + zeta*(1 + mu*h2/Lc + mu*d/Lc*(h2-h3)/Lt));
% [deg]
disp(simplify(thetaFWD*180/pi))

thetaFWDval = double(subs(thetaFWD*180/pi,[mu Mf Mr Mt Mzb h1 h2 h3 d Lc Lt ],[muVal MfVal MrVal MtVal MzbVal h1Val h2Val h3Val dVal LcVal LtVal]));
disp(thetaFWDval)

%% Gradeability Rear Wheel Drive - RWD

% [rad]
thetaRWD = mu*(b/Lc + zeta*(Lc+d)/Lc*f/Lt)/(1 - mu*h1/Lc + zeta*(1 - mu*h2/Lc - mu*(Lc+d)/Lc*(h2-h3)/Lt));
% [deg]
disp(simplify(thetaRWD*180/pi))

thetaRWDval = double(subs(thetaRWD*180/pi,[mu Mf Mr Mt Mzb h1 h2 h3 d Lc Lt ],[muVal MfVal MrVal MtVal MzbVal h1Val h2Val h3Val dVal LcVal LtVal]));
disp(thetaRWDval)

%% Gradeability 4 (four) Wheel Drive - 4WD

% [rad]
theta4WD = mu*1/(1+zeta);
% [deg]
disp(simplify(theta4WD*180/pi))

theta4WDval = double(subs(theta4WD*180/pi,[mu Mf Mr Mt Mzb h1 h2 h3 d Lc Lt ],[muVal MfVal MrVal MtVal MzbVal h1Val h2Val h3Val dVal LcVal LtVal]));
disp(theta4WDval)

