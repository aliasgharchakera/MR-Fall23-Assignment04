function [P] = update_P(P, H, Fu, Fx, Q, R)
    % size_H = size(H)
    % H
    % size_P = size(P)
    P_BAR = Fx*P*Fx'+Fu*Q*Fu';
    PINt = H*P_BAR*H' + R;
    Kk = P_BAR*H'*(PINt)^(-1);
    P = P_BAR - Kk*PINt*Kk'; 
end
