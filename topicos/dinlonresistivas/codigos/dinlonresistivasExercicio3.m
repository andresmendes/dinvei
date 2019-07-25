%% Din�mica longitudinal - For�as resisitivas - Exerc�cio 3
% For�a de resist�ncia ao rolamento do caminh�o.
%
% Fonte: Gillespie Cap4Ex1.
%
%% Par�metros
m  = 32874;                 % Massa do carro [kg]
g  = 9.81;                  % Acelera��o da gravidade [m/s2]
Ch = 1.0;                   % Coeficiente da qualidade da pista.

% Vetores velocidade
vKPH = 80:1:110;            % Velocidade [km/h]
vMS  = vKPH/3.6;            % Velocidade [m/s]
vMPH = vKPH/1.609;          % Velocidade [mph]

%% For�a de resist�ncia ao rolamento
W = m*g;        % Massa do carro [kg]

fr = (0.0041 + 0.000041*vMPH)*Ch;

Rx = fr*W;      % [N]

%% Pot�ncia da for�a de resist�ncia ao rolamento
PRx   = Rx.*vMS;            % Pot�ncia [w]
PRxhp = PRx/745.7;          % Pot�ncia [HP]

%% Resultado

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'xlim',[vKPH(1) vKPH(end)])
plot(vMPH*1.609,Rx,'linewidth',3)
xlabel('velocidade [km/h]')
ylabel('Rx [N]')
% print(gcf,'-dpng','dinlonresistivasExercicio3Forca.png')

figure
hold on ; grid on ; box on
set(gca,'fontsize',15,'xlim',[vKPH(1) vKPH(end)])
plot(vMPH*1.609,PRxhp,'linewidth',3)
xlabel('velocidade [km/h]')
ylabel('PRx [HP]')
% print(gcf,'-dpng','dinlonresistivasExercicio3Potencia.png')
