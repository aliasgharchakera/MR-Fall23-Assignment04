function Xpred = predictParticles(Xpri, u, Q, g, b)
%PREDICT Summary of this function goes here
%   Detailed explanation goes here
    Xpred = g(Xpri, u) + b(Xpri, u) * Q * b(Xpri, u)';
end