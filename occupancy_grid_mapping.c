function occupancy_grid_mapping()
    % Define the inverse sensor model
    function log_odds = inv_sensor_model(z, c)
        if c > z + 20
            % No update if beyond 20 cm of the measurement
            log_odds = 0;
        elseif c > z
            % Occupied with probability 0.6
            log_odds = log(0.6 / (1 - 0.6));
        else
            % Free with probability 0.3
            log_odds = log(0.3 / (1 - 0.3));
        end
    end

    % Cell positions in cm (0 to 200 with step of 10)
    c = 0:10:200;
    
    % Map belief in log-odds form
    logodds = zeros(1, length(c));
    
    % Measurements in cm
    meas = [101, 82, 91, 112, 99, 151, 96, 85, 99, 105];
    
    % Prior in log-odds form, since p = 0.5, log-odds is 0
    prior = log(0.5 / (1 - 0.5));
    disp(['prior:', num2str(prior)]);
    
    % Update map with each measurement
    for i = 1:length(meas)
        % Update each cell
        for j = 1:length(c)
            % Update log-odds using the inverse sensor model
            logodds(j) = logodds(j) - prior + inv_sensor_model(meas(i), c(j));
        end
    end
    
    % Convert log-odds to probabilities
    m = 1 - 1 ./ (1 + exp(logodds));
    
    % Plot the results
    figure;
    plot(c, m, 'LineWidth', 2);
    xlabel('x-position [cm]');
    ylabel('occupancy p(x)');
    title('Occupancy Grid Mapping');
    grid on;
    saveas(gcf, 'graph.pdf');
end
