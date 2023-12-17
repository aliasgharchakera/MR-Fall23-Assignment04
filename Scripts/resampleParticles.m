function [Xresampled, Wresampled] = resampleSystematic(X, W)
%RESAMPLESYSTEMATIC Systematic resampling
%   Resample the particles using the systematic resampling algorithm.
%
%   Inputs:
%       X           [n x N] Particles, each column is a particle.
%       W           [1 x N] Weights, corresponding to the particles.
%
%   Outputs:
%       Xresampled  [n x N] Resampled particles, each corresponding to a
%                           particle in X.
%       Wresampled  [1 x N] Resampled weights, each corresponding to a
%                           particle in Xresampled.
%
%   See also RESAMPLEMULTINOMIAL, RESIDUALRESAMPLING, RESAMPLESTRATIFIED
%   and RESAMPLEINVERSETRANSFORM.

% Your code here!
N = size(X,2);
Xresampled = zeros(size(X));
Wresampled = zeros(size(W));
r = rand(1)/N;
c = W(1);
i = 1;
for m = 1:N
    U = r + (m-1)/N;
    while U > c
        i = i + 1;
        c = c + W(i);
    end
    Xresampled(:,m) = X(:,i);
    Wresampled(m) = 1/N;
end
end