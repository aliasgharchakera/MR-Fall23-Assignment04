function estimatedPose = estimatePose(particles, weights)
    % Estimate the pose as the weighted mean of the particles
    estimatedPose = sum(particles .* weights) / sum(weights);
end
