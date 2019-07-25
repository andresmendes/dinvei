%% Din�mica longitudinal - For�a de frenagem - Exerc�cio 1
% Dist�ncia e tempo de frenagem
%
%% Par�metros

clear ; close all ; clc

m  = 1145;          % massa [kg]
v  = 80/3.6;        % velocidade [m/s]
Fx = 4000;          % for�a de frenagem [N]

%% Desacelera��o [m/s2]

Dx = Fx/m

%% Dist�ncia de frenagem [m]

SD = v^2/(2*Dx)

%% Tempo de frenagem [s]

ts = v/Dx

% % Verifica��o Gillespie Cap3Ex1
% m  = 3635*0.453592;     % massa [kg]
% v  = 60*0.44704;        % velocidade [m/s]
% Fx = 8896.4432565018;   % for�a de frenagem [N]
% Dx = Fx/m*3.28084       % Desacelera��o [m/s2]
% SD = v^2/(2*Fx/m)*3.28084 % Dist�ncia de frenagem [m]
% ts = v/(Fx/m)               % Tempo de frenagem [s]
