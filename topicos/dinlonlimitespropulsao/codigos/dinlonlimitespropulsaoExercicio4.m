%% Din�mica longitudinal - Limites de propuls�o - Exerc�cio 4
% Limite da for�a de tra��o devido ao atrito.
%
%% Par�metros

clear ; close all ; clc

mu = 0.62;          % Coeficiente de atrito
g = 9.81;           % Acelera��o da gravidade [m/s2]
mf = 952.5;         % Massa sobre eixo dianteiro [kg]
mr = 839.1;         % Massa sobre eixo traseiro  [kg]
h = 0.533;          % Altura do centro de massa [m]
L = 2.743;          % Dist�ncia entre eixos [m]
t = 1.498;          % Bitola [m]
Nf = 2.9;           % Rela��o de transmiss�o do diferencial
Kphif = 1559;       % Rigidez � rolagem da suspens�o dianteira [Nm/deg]
Kphir = 379;        % Rigidez � rolagem da suspens�o traseira [Nm/deg]
r = 0.33;           % Raio do pneu [m]

%% C�lculos preliminares

Wf = mf*g;          % Peso sobre o eixo dianteiro [N]
Wr = mr*g;          % Peso sobre o eixo traseiro [N]

% Rigidez total
Kphi = Kphif + Kphir; % Rigidez de rolagem total

%% For�a de tra��o m�xima com diferencial aberto


FxAberto = mu*Wr/(1 - h/L*mu + 2*mu*r/(Nf*t)*Kphif/Kphi)

FxAbertoLb = 0.2248089431*FxAberto

%% For�a de tra��o m�xima com diferencial aberto

FxBloqueado = mu*Wr/(1 - h/L*mu)

FxBloqueadoLb = 0.2248089431*FxBloqueado


