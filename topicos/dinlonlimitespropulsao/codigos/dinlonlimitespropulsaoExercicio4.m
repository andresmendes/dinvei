%% Dinâmica longitudinal - Limites de propulsão - Exercício 4
% Limite da força de tração devido ao atrito.
%
%% Parâmetros

clear ; close all ; clc

mu = 0.62;          % Coeficiente de atrito
g = 9.81;           % Aceleração da gravidade [m/s2]
mf = 952.5;         % Massa sobre eixo dianteiro [kg]
mr = 839.1;         % Massa sobre eixo traseiro  [kg]
h = 0.533;          % Altura do centro de massa [m]
L = 2.743;          % Distância entre eixos [m]
t = 1.498;          % Bitola [m]
Nf = 2.9;           % Relação de transmissão do diferencial
Kphif = 1559;       % Rigidez à rolagem da suspensão dianteira [Nm/deg]
Kphir = 379;        % Rigidez à rolagem da suspensão traseira [Nm/deg]
r = 0.33;           % Raio do pneu [m]

%% Cálculos preliminares

Wf = mf*g;          % Peso sobre o eixo dianteiro [N]
Wr = mr*g;          % Peso sobre o eixo traseiro [N]

% Rigidez total
Kphi = Kphif + Kphir; % Rigidez de rolagem total

%% Força de tração máxima com diferencial aberto


FxAberto = mu*Wr/(1 - h/L*mu + 2*mu*r/(Nf*t)*Kphif/Kphi)

FxAbertoLb = 0.2248089431*FxAberto

%% Força de tração máxima com diferencial aberto

FxBloqueado = mu*Wr/(1 - h/L*mu)

FxBloqueadoLb = 0.2248089431*FxBloqueado


