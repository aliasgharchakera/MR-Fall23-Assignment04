function newState = transitionFunction(state, control, b)
       % Extract current state components
       x = state(1);
       y = state(2);
       theta = state(3);
   
       % Extract control inputs (e.g., linear and angular velocity)
       v = control(1);
       omega = control(2);
   
       % Time step
       dt = b;  % You might want to pass the time step (dt) explicitly
   
       % Predict next state based on motion model
       newX = x + v * cos(theta) * dt;
       newY = y + v * sin(theta) * dt;
       newTheta = theta + omega * dt;
   
       % Return new state
       newState = [newX, newY, newTheta];
   end
   