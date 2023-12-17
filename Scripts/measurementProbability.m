function weight = measurementProbability(particle, Z, M, g)
    % Compute measurement likelihood for a particle
    predictedMeasurement = measurementFunction(particle, M, g);
    weight = mvnpdf(Z, predictedMeasurement, R);  % R needs to be defined or passed as a parameter
end
