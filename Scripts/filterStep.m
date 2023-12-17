function [particles, weights] = filterStep(particles, weights, u, Z, R, M, g, b)
    % Prediction Step
    for i = 1:M
        particles(i, :) = transitionFunction(particles(i, :), u, b) + randn(1, 3) .* sqrt(diag(R));
    end

    % Update Step
    if ~isempty(Z)
        for i = 1:M
            weights(i) = measurementProbability(particles(i, :), Z, M, g);
        end
        weights = weights / sum(weights);  % Normalize weights
    end

    % Resampling Step
    particles = systematicResample(particles, weights);
    weights = ones(M, 1) / M;  % Reset weights
end
