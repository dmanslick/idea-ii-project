clear();
clc();

% load data and get input and output data as matricies
[training_data, testing_data] = utils.load_data();
[inputs, outputs] = utils.get_inputs_outputs(training_data);

% create regressions
multivariate_lin_reg = factories.create_multivariate_lin_reg(inputs, outputs);
predictions = multivariate_lin_reg(inputs);

% chart actual vs predicted and residual error for DO_1
do1_error = predictions(:, 1) - outputs(:, 1);

% calculate average percent error for DO_1 (ignore zero actual values)
nonzero_mask = outputs(:, 1) ~= 0;
do1_percent_error = abs(do1_error(nonzero_mask) ./ outputs(nonzero_mask, 1)) * 100;
avg_do1_percent_error = mean(do1_percent_error);
fprintf("Average percent error (DO_1): %.4f%%\n", avg_do1_percent_error);

figure;
subplot(2, 1, 1);
plot(outputs(:, 1), "DisplayName", "Actual DO_1");
hold on;
plot(predictions(:, 1), "DisplayName", "Predicted DO_1");
hold off;
xlabel("Sample");
ylabel("DO_1");
title("DO_1: Actual vs Predicted");
legend("Location", "best");
grid on;

subplot(2, 1, 2);
plot(do1_error, "DisplayName", "DO_1 Error (Predicted - Actual)");
hold on;
yline(0, "--k", "DisplayName", "Zero Error");
hold off;
xlabel("Sample");
ylabel("Error");
title("DO_1 Regression Error");
legend("Location", "best");
grid on;