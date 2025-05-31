function [x, P] = tu_qw_no(x, P, T, Rw)
    F = eye(4);
    G = (T/2)*Sq(x);

    x = F*x;
    P = F*P*F' + G * Rw * G';
    
    [x, P] = mu_normalizeQ(x, P);
end

