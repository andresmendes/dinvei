%% Regress�o linear para identifica��o do pneu

clear ; close all ; clc

v = [30 60];
Rx = [100 200];

[r,m,b] = regression(v,Rx)

plotregression(v,Rx)

