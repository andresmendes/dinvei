%% Dinâmica longitudinal - Desempenho em rampa - Exercício 7
%
%% Dados 
mu = 0.3;
Mf = 1090;
Mr = 820;
Mt = 1200;
Mzb = 320;
h1 = 0.6;
h2 = 0.35;
h3 = 0.51;
d = 0.47;
Lc = 3.1;
Lt = 4.0;

g = 9.81;           % Aceleração da gravidade [m/s2]

%% Dados do carro
Wf = Mf*g;          % Peso sobre o eixo dianteiro [N]
Wr = Mr*g;          % Peso sobre o eixo traseiro [N]

%% Dados do reboque
Wt = Mt*g;          % Peso sobre o eixo do reboque [N]
Fzb = Mzb*g;        % Carga sobre o engate [N];

%% Cálculo
W = Wf + Wr;        % Peso total do carro [lb]
Wb = Wt + Fzb;      % Peso total do reboque [lb]
zeta = Wb/W;        % Razão dos pesos reboque/carro
% Posição do CG do carro
b = Wr/W*Lc;
c = Wf/W*Lc;
% Posição do CG do reboque
f = Fzb/Wb*Lt;

%% Gradeability Front Wheel Drive - FWD

% [rad]
thetaFWD = mu*(c/Lc - zeta*d/Lc*f/Lt)/(1 + mu*h1/Lc + zeta*(1 + mu*h2/Lc + mu*d/Lc*(h2-h3)/Lt));
% [deg]
disp(thetaFWD*180/pi)

%% Gradeability Rear Wheel Drive - RWD

% [rad]
thetaRWD = mu*(b/Lc + zeta*(Lc+d)/Lc*f/Lt)/(1 - mu*h1/Lc + zeta*(1 - mu*h2/Lc - mu*(Lc+d)/Lc*(h2-h3)/Lt));
% [deg]
disp(thetaRWD*180/pi)

%% Gradeability 4 (four) Wheel Drive - 4WD

% [rad]
theta4WD = mu*1/(1+zeta);
% [deg]
disp(theta4WD*180/pi)