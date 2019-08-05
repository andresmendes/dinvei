%% Dinâmica longitudinal - Forças resisitivas - Exercício 2
% Força de resistência ao rolamento do caminhão.
%
% Fonte: Gillespie Cap4Ex1.
%
%% Dados
m  = 32874;                 % Massa do carro [kg]
g  = 9.81;                  % Aceleração da gravidade [m/s2]
Ch = 1.0;                   % Coeficiente da qualidade da pista.

% Vetores velocidade
vKPH = 85:1:110;            % Velocidade [km/h]
vMS  = vKPH/3.6;            % Velocidade [m/s]
vMPH = vKPH/1.609;          % Velocidade [mph]

%% Força de resistência ao rolamento
W = m*g;        % Massa do carro [kg]

fr = (0.0041 + 0.000041*vMPH)*Ch;

Rx = fr*W;      % [N]

%% Potência da força de resistência ao rolamento
PRx   = Rx.*vMS;            % Potência [w]
PRxhp = PRx/745.7;          % Potência [HP]

%% Resultado

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'xlim',[vKPH(1) vKPH(end)])
plot(vKPH,Rx,'linewidth',3)
xlabel('velocidade [km/h]')
ylabel('Rx [N]')

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'xlim',[vKPH(1) vKPH(end)])
plot(vKPH,PRxhp,'linewidth',3)
plot([vKPH(1) vKPH(end)],[PRxhp(1) PRxhp(end)],'k--')
xlabel('velocidade [km/h]')
ylabel('PRx [HP]')
legend('curva','reta ref.','Location','NorthWest')
