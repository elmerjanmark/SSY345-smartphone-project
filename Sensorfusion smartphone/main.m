
clear;
startup();

%%
[xhat, meas] = filterTemplate();
%% 

%load("data.mat")
%load("data_ute.mat")


acc_mean = mean(meas.acc(:, ~any(isnan(meas.acc), 1)), 2);
gyro_mean = mean(meas.gyr(:, ~any(isnan(meas.gyr), 1)), 2);
mag_mean = mean(meas.mag(:, ~any(isnan(meas.mag), 1)), 2);

acc_var = var(meas.acc(:, ~any(isnan(meas.acc), 1)),0, 2);
gyro_var = var(meas.gyr(:, ~any(isnan(meas.gyr), 1)),0, 2);
mag_var = var(meas.mag(:, ~any(isnan(meas.mag), 1)),0, 2);

%%

ploting(meas, [acc_mean, gyro_mean, mag_mean], [acc_var, gyro_var, mag_var]);

%% Calibrated
calAcc = struct('m', acc_mean, 'R', diag(acc_var));
calGyr = struct('m', gyro_mean, 'R', diag(gyro_var));
calMag = struct('m', mag_mean, 'R', diag(mag_var));


%% calibrate g0
%load("g0_cal.mat")

g0 = calAcc.m;

calAcc.g0 = g0;

%%

m0 = [0; sqrt(calMag.m(1)^2 + calMag.m(2)^2); calMag.m(3)];
calMag.m0 = m0;

%%

[xhats, meass] = filterTemplate_C(calAcc, calGyr, calMag);

%% 

eu_filter = q2euler(xhats.x);
eu_orient = q2euler(meass.orient);
%%
figure; hold on; grid on;
plot(xhats.t,eu_filter(1,:));
plot(meass.t,eu_orient(1,:));
legend('Roll own', 'Roll google')
xlabel('time')
ylabel('Angle')
figure; hold on; grid on;
plot(xhats.t,eu_filter(2,:));
plot(meass.t,eu_orient(2,:));
legend('Pitch own', 'Pitch google')
xlabel('time')
ylabel('Angle')
figure; hold on; grid on;
plot(xhats.t,eu_filter(3,:));
plot(meass.t,eu_orient(3,:));
legend('Yaw own', 'Yaw google')
xlabel('time')
ylabel('Angle')