function predictedMeasurement = measurementFunction(particle, M, g)
    % Extract particle state
    x = particle(1);
    y = particle(2);
    theta = particle(3);

    % For simplicity, let's assume a single range measurement to a known landmark
    % In practice, you'll want to use your actual sensor model and environment data

    % Known landmark position (example)
    landmarkX = M(1);
    landmarkY = M(2);

    % Predict range and bearing to the landmark
    range = sqrt((landmarkX - x)^2 + (landmarkY - y)^2);
    bearing = atan2(landmarkY - y, landmarkX - x) - theta;

    % Return predicted measurement
    predictedMeasurement = [range; bearing];
end
