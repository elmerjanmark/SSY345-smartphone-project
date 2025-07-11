function x = ploting(meas, mu_list, var_list)

% Clean data (remove columns with NaNs)
acc = meas.acc(:, ~any(isnan(meas.acc), 1));
gyro = meas.gyr(:, ~any(isnan(meas.gyr), 1));
mag = meas.mag(:, ~any(isnan(meas.mag), 1));

% Unpack means and variances
mu_acc  = mu_list(:,1);    var_acc  = var_list(:,1);
mu_gyro = mu_list(:,2);    var_gyro = var_list(:,2);
mu_mag  = mu_list(:,3);    var_mag  = var_list(:,3);

% ACCELEROMETER
figure; sgtitle('Accelerometer'); grid on;

subplot(3,1,1); hold on;
histogram(acc(1,:), 50, 'Normalization', 'pdf');
x = linspace(min(acc(1,:)), max(acc(1,:)), 100);
plot(x, normpdf(x, mu_acc(1), sqrt(var_acc(1))), 'r', 'LineWidth', 1.5);
xlabel('$x_{acc}$', 'Interpreter', 'latex'); grid on;
sigma = sqrt(var_acc(1));
xlim([mu_acc(1) - 3*sigma, mu_acc(1) + 3*sigma])

subplot(3,1,2); hold on;
histogram(acc(2,:), 50, 'Normalization', 'pdf');
x = linspace(min(acc(2,:)), max(acc(2,:)), 100);
plot(x, normpdf(x, mu_acc(2), sqrt(var_acc(2))), 'r', 'LineWidth', 1.5);
xlabel('$y_{acc}$', 'Interpreter', 'latex'); grid on;
sigma = sqrt(var_acc(2));
xlim([mu_acc(2) - 3*sigma, mu_acc(2) + 3*sigma])

subplot(3,1,3); hold on;
histogram(acc(3,:), 50, 'Normalization', 'pdf');
x = linspace(min(acc(3,:)), max(acc(3,:)), 100);
plot(x, normpdf(x, mu_acc(3), sqrt(var_acc(3))), 'r', 'LineWidth', 1.5);
xlabel('$z_{acc}$', 'Interpreter', 'latex'); grid on;
sigma = sqrt(var_acc(3));
xlim([mu_acc(3) - 3*sigma, mu_acc(3) + 3*sigma])

% GYROSCOPE
figure; sgtitle('Gyroscope'); grid on;

subplot(3,1,1); hold on;
histogram(gyro(1,:), 50, 'Normalization', 'pdf');
x = linspace(min(gyro(1,:)), max(gyro(1,:)), 100);
plot(x, normpdf(x, mu_gyro(1), sqrt(var_gyro(1))), 'r', 'LineWidth', 1.5);
xlabel('$\omega_x$', 'Interpreter', 'latex'); grid on;
sigma = sqrt(var_gyro(1));
xlim([mu_gyro(1) - 3*sigma, mu_gyro(1) + 3*sigma])


subplot(3,1,2); hold on;
histogram(gyro(2,:), 50, 'Normalization', 'pdf');
x = linspace(min(gyro(2,:)), max(gyro(2,:)), 100);
plot(x, normpdf(x, mu_gyro(2), sqrt(var_gyro(2))), 'r', 'LineWidth', 1.5);
xlabel('$\omega_y$', 'Interpreter', 'latex'); grid on;
sigma = sqrt(var_gyro(2));

xlim([mu_gyro(2) - 3*sigma, mu_gyro(2) + 3*sigma])


subplot(3,1,3); hold on;
histogram(gyro(3,:), 50, 'Normalization', 'pdf');
x = linspace(min(gyro(3,:)), max(gyro(3,:)), 100);
plot(x, normpdf(x, mu_gyro(3), sqrt(var_gyro(3))), 'r', 'LineWidth', 1.5);
xlabel('$\omega_z$', 'Interpreter', 'latex'); grid on;
sigma = sqrt(var_gyro(3));

xlim([mu_gyro(3) - 3*sigma, mu_gyro(3) + 3*sigma])


% MAGNETOMETER
figure; sgtitle('Magnetometer'); grid on;

subplot(3,1,1); hold on;
histogram(mag(1,:), 50, 'Normalization', 'pdf');
x = linspace(min(mag(1,:)), max(mag(1,:)), 100);
plot(x, normpdf(x, mu_mag(1), sqrt(var_mag(1))), 'r', 'LineWidth', 1.5);
xlabel('$mag_x$', 'Interpreter', 'latex'); grid on;
sigma = sqrt(var_mag(1));

xlim([mu_mag(1) - 3*sigma, mu_mag(1) + 3*sigma])


subplot(3,1,2); hold on;
histogram(mag(2,:), 50, 'Normalization', 'pdf');
x = linspace(min(mag(2,:)), max(mag(2,:)), 100);
plot(x, normpdf(x, mu_mag(2), sqrt(var_mag(2))), 'r', 'LineWidth', 1.5);
xlabel('$mag_y$', 'Interpreter', 'latex'); grid on;
sigma = sqrt(var_mag(2));

xlim([mu_mag(2) - 3*sigma, mu_mag(2) + 3*sigma])


subplot(3,1,3); hold on;
histogram(mag(3,:), 50, 'Normalization', 'pdf');
x = linspace(min(mag(3,:)), max(mag(3,:)), 100);
plot(x, normpdf(x, mu_mag(3), sqrt(var_mag(3))), 'r', 'LineWidth', 1.5);
xlabel('$mag_z$', 'Interpreter', 'latex'); grid on;
sigma = sqrt(var_mag(3));

xlim([mu_mag(3) - 3*sigma, mu_mag(3) + 3*sigma])


% TIME-DOMAIN SIGNALS
figure; grid on; hold on;
plot(meas.t, meas.acc(1,:), meas.t, meas.acc(2,:), meas.t, meas.acc(3,:));
xlabel('Time Step'); ylabel('Acceleration'); title('Accelerometer Signal');
legend({'Acc x', 'Acc y', 'Acc z'});

figure; grid on; hold on;
plot(meas.t, meas.gyr(1,:), meas.t, meas.gyr(2,:), meas.t, meas.gyr(3,:));
xlabel('Time Step'); ylabel('Angular Velocity'); title('Gyroscope Signal');
legend({'Gyro x', 'Gyro y', 'Gyro z'});

figure; grid on; hold on;
plot(meas.t, meas.mag(1,:), meas.t, meas.mag(2,:), meas.t, meas.mag(3,:));
xlabel('Time Step'); ylabel('Magnetometer'); title('Magnetometer Signal');
legend({'Mag x', 'Mag y', 'Mag z'});

end
