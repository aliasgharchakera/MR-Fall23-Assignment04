function [Xpost, W] = updateParticles(Xpred, Z, R, M)
%UPDATEPARTICLES Update the particles using the measurement Z
%   Xpred: 3xM matrix of particles
%   Z: 2x1 vector of measurements
%   R: 2x2 measurement noise covariance matrix
%   M: number of particles
%   Xpost: 3xM matrix of updated particles
%   W: 1xM vector of particle weights
    % Initialize variables
    Xpost = zeros(size(Xpred));
    W = zeros(1, M);
    
    % Update particles
    for i = 1:M
        % Generate measurement noise
        noise = mvnrnd([0; 0], R)';
        
        % Compute predicted measurement
        Zpred = h(Xpred(:, i)) + noise;
        
        % Compute measurement likelihood
        likelihood = mvnpdf(Z, Zpred, R);
        
        % Update particle weight
        W(i) = likelihood;
    end
    
    % Normalize weights
    W = W / sum(W);
    
    % Resample particles
    indices = randsample(1:M, M, true, W);
    Xpost = Xpred(:, indices);
end

function Zpred = h(X)
    % Measurement function
    % X: 3x1 state vector
    % Zpred: 2x1 predicted measurement vector
    
    % Implement your measurement function here
    % For example:
    % Zpred = [X(1); X(2)];
    Zpred = [sqrt(X(1)^2 + X(2)^2); atan2(X(2), X(1))];
end
