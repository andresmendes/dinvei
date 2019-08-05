%% dinlonforcasresistivas2
% Fonte: Gillespie Cap4Ex1.
%
%% Dados

clear ; close all ; clc

syms vKPH m

g = 9.81;
Ch=1;

% Vetores velocidade
vMS  = vKPH/3.6;            % Velocidade [m/s]
vMPH = vKPH/1.609;          % Velocidade [mph]

%% Força rolamento

W = m*g;        % Massa do carro [kg]

fr = (0.0041 + 0.000041*vMPH)*Ch;

Rx = fr*W      % [N]

%% Potência da força de resistência ao rolamento
PRx   = Rx.*vMS;            % Potência [w]
PRxhp = PRx/745.7          % Potência [HP]

