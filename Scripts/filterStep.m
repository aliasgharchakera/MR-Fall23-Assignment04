function [updated_particles, P_posterior] = filterStep(particles, P, u, Q, Z, R, M, g, b)
    N = size(particles,2);
    X_new = particles(1:3, :);
    W_new = particles(end, :);

    for i = 1:N
        X_prev = particles(1:3,i);
        [X_bar,Fx, Fu]= odometry(X_prev, u, b);
        X_new(1:3,i)=X_bar;
        [z_, H_seq, R_seq, Associated_landmark] = MCL_association(X_new, P(:,i:i+2), Z, R, M, g);
        if sum(Associated_landmark) > 0
            % If a correspondence was found
            for j = 1:size(z_,2)
                % The loop is only for when there are multiple measurements
                pdf = measurementProbability(z_(:,j), R_seq(:,:,j), M(:,j), X_bar);
                W_new(i) = pdf*W_new;
            end
        % Update the Covariance matrix P
        P(:,i:i+2) = updateP(P(:,i:i+2), H_seq, Fu, Fx, Q, R);
        end
    end
    % Normalize
    W_new = W_new/sum(W_new);
    updated_particles = resampleParticles(X_new, W_new, N);
    P_posterior = P;
end
