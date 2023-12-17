function newParticles = systematicResample(particles, weights)
    % Systematic resampling algorithm
    N = length(weights);
    positions = ((1:N) - rand(1)) / N;
    indexes = zeros(1, N);
    cumsumWeights = cumsum(weights);
    i = 1;
    for j = 1:N
        while positions(j) > cumsumWeights(i)
            i = i + 1;
        end
        indexes(j) = i;
    end
    newParticles = particles(indexes, :);
end
