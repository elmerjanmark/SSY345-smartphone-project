function [x, P] = tu_qw(x, P, omega, T, Rw)
    F = eye(4) + (T/2)* Somega(omega);
    G = (T/2)*Sq(x);

    x_ = F*x;
    P_ = F*P*F' + G * Rw * G';

    [x, P] = mu_normalizeQ(x_, P_);
end

