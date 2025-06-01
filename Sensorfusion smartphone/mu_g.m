function [x,P] = mu_g(x, P, yacc, Ra, g0)
    % assuming fka = 0;
    y_pred = Qq(x)' * g0;

    [Q0, Q1, Q2, Q3] = dQqdq(x);     %jacob ian
    H = [Q0'*g0, Q1'*g0, Q2'*g0, Q3'*g0];

    v = yacc - y_pred;     %innovation residual
    S = H * P * H' + Ra;     %innovation covariance
    K = P * H' / S;     %kalman gain
    
    % update
    x = x + K*v;
    P = P - K*S*K';
    [x, P] = mu_normalizeQ(x, P);
end

