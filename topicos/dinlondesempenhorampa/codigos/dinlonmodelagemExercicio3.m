%% Din�mica longitudinal - Desempenho em rampa - Exerc�cio 3 (Cen�rio 3)
% Acelera��o simples com arrasto aerodin�mico
%
%% Dados
m = 1000;           % Massa do carro [kg]
T = 1000;           % For�a de tra�a� [N]
c = 50;             % Coeficiente [Ns/m]

%% Simula��o Euler

vf = 0;                 % Velocidade inicial [m/s]
dt = 0.1;               % Passo da simula��o [s]
t = 0:dt:100;           % Tempo de simula��o [s]

for i=1:length(t)-1
    vi = vf(end);
    vf(i+1) = (T - c*vi)*dt/m + vi;
end

%% Simula��o via fun��o step

opt = stepDataOptions;
opt.StepAmplitude = T;
sys = tf(1,[m c]);
[ySim,tSim] = step(sys,t,opt);

figure
hold on ; grid on ; box on
plot(tSim,ySim)
plot(t,vf,'r--')
xlabel('tempo [s]')
ylabel('velocidade [m/s]')
legend('step','passo euler','Location','SouthEast')
