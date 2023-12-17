function Xpri = generateParticles(X, N, sigma, mu)
% Generate particles around the current state
% X: current state
% N: number of particles
% sigma: standard deviation of the noise
% mu: mean of the noise
% Xpri: generated particles

Xpri = zeros(size(X,1), N);
for i = 1:size(X,1)
    Xpri(i,:) = X(i) + sigma(i)*randn(1,N) + mu(i);
end

end