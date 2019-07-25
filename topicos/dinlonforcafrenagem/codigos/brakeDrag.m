clear ; close all ; clc


syms M Fb c v

f1 = M*v/(Fb + c*v^2)


f2 = M/(Fb + c*v^2)

res1 = int(f1)


res2 = int(f2)


%% fazer verificação via simulação