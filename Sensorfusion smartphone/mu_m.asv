function [x,P] = mu_m(x, P, mag, m0,Rm)

    % assuming fkm = 0;
    y_pred = Qq(x)' * m0;

    [Q0, Q1, Q2, Q3] = dQqdq(x);     %jacob ian
    H = [Q0'*m0, Q1'*m0, Q2'*m0, Q3'*m0];

    v = mag - y_pred;     %innovation residual
    S = H * P * H' + Rm;     %innovation covariance
    K = P * H' / S;     %kalman gain
    
    % update
    x = x + K*v;
    P = P - K*S*K';
    [x, P] = mu_normalizeQ(x, P);
end