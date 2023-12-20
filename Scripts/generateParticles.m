function particles = generateParticles(numParticles, map)
    angles = map(1,:);
    M = map(2,:);
    
    left_max = max(M(angles == 0));
    right_max = max(M(angles == pi));
    up_max = max(M(angles == pi/2));
    down_max = max(M(angles == -pi/2));
    
    particles = zeros(4, numParticles);
    particles(1,:) = unifrnd(-left_max, right_max, 1, numParticles);
    particles(2,:) = unifrnd(-down_max, up_max, 1, numParticles);
    particles(3,:) = unifrnd(0, 2*pi, 1, numParticles);
    particles(4,:) = ones(1, numParticles);
end