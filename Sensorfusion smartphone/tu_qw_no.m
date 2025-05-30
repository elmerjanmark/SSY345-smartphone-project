function [x, P] = tu_qw_no(x, P, Rw)
    F = eye(4);
    G = 0;

    x_ = F*x;
    P_ = F*P*F' + G * Rw * G';

    [x, P] = mu_normalizeQ(x_, P_);
end

