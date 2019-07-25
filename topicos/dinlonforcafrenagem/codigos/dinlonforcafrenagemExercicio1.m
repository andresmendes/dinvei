%% Dinâmica longitudinal - Força de frenagem - Exercício 1
% Distância e tempo de frenagem
%
%% Parâmetros

clear ; close all ; clc

m  = 1145;          % massa [kg]
v  = 80/3.6;        % velocidade [m/s]
Fx = 4000;          % força de frenagem [N]

%% Desaceleração [m/s2]

Dx = Fx/m

%% Distância de frenagem [m]

SD = v^2/(2*Dx)

%% Tempo de frenagem [s]

ts = v/Dx

% % Verificação Gillespie Cap3Ex1
% m  = 3635*0.453592;     % massa [kg]
% v  = 60*0.44704;        % velocidade [m/s]
% Fx = 8896.4432565018;   % força de frenagem [N]
% Dx = Fx/m*3.28084       % Desaceleração [m/s2]
% SD = v^2/(2*Fx/m)*3.28084 % Distância de frenagem [m]
% ts = v/(Fx/m)               % Tempo de frenagem [s]
