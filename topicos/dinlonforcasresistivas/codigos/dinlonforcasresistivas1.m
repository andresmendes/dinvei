%% dinlonforcasresistivas1
% Fonte: Gillespie Cap4Ex1.
%
%% Dados

clear ; close all ; clc

syms vKPH A Cd

rho = 1;                    % Densidade do ar [kg/m3]

% Vetores velocidade
vMS  = vKPH/3.6;            % Velocidade [m/s]

%% Força aero

DA = 1/2 * rho * Cd * A * vMS.^2

%% Potência

PDA   = DA.*vMS;            % Potência [w]
PDAhp = PDA/745.7          % Potência [HP]

