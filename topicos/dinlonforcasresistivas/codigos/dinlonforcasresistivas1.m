%% dinlonforcasresistivas1
% Fonte: Gillespie Cap4Ex1.
%
%% Dados

clear ; close all ; clc

syms vKPH A Cd

rho = 1;                    % Densidade do ar [kg/m3]

% Vetores velocidade
vMS  = vKPH/3.6;            % Velocidade [m/s]

%% For�a aero

DA = 1/2 * rho * Cd * A * vMS.^2

%% Pot�ncia

PDA   = DA.*vMS;            % Pot�ncia [w]
PDAhp = PDA/745.7          % Pot�ncia [HP]

