%% Dinâmica longitudinal - Desempenho em rampa - Exercício 3 (Cenário 3)
% Aceleração simples com arrasto aerodinâmico
%
%% Dados
m = 1000;           % Massa do carro [kg]
T = 1000;           % Força de traçaõ [N]
c = 50;             % Coeficiente [Ns/m]

%% Simulação Euler

vf = 0;                 % Velocidade inicial [m/s]
dt = 0.1;               % Passo da simulação [s]
t = 0:dt:100;           % Tempo de simulação [s]

for i=1:length(t)-1
    vi = vf(end);
    vf(i+1) = (T - c*vi)*dt/m + vi;
end

%% Simulação via função step

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
