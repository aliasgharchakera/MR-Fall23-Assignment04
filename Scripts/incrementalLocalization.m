function [x_posteriori, particles, weights] = incrementalLocalization(particles, weights, u, Z, R, M, params, g, b)
    if isempty(particles)
        % Initialize particles
        particles = [rand(M, 2) * params.mapSize, rand(M, 1) * 2 * pi];
        weights = ones(M, 1) / M;
    end

    % Particle Filter Step
    [particles, weights] = filterStep(particles, weights, u, Z, R, M, g, b);

    % Estimate robot pose
    x_posteriori = estimatePose(particles, weights);
end
