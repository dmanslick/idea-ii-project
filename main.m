clear();
clc();

% load data and get input and output data as matricies

[training_data, testing_data] = utils.load_data();
[training_inputs, training_outputs] = utils.get_inputs_outputs(training_data);
[test_inputs, test_outputs] = utils.get_inputs_outputs(testing_data);

% create regressions

multivariate_lin_reg = factories.create_multivariate_lin_reg(training_inputs, training_outputs);
multivariate_lin_reg_predictions = multivariate_lin_reg(test_inputs);

multivariate_gen_lin_reg = factories.create_multivariate_gen_lin_reg(training_inputs, training_outputs);
multivariate_gen_lin_reg_predictions = multivariate_gen_lin_reg(test_inputs);

% calculate and print average RMSE's for different regressions

multivariate_lin_reg_avg_rmse = utils.calc_avg_norm_rmse(multivariate_lin_reg_predictions, test_outputs);
fprintf("multivariate_lin_reg_avg_rmse: %.4f\n", multivariate_lin_reg_avg_rmse);

multivariate_gen_lin_reg_avg_rsme = utils.calc_avg_norm_rmse(multivariate_gen_lin_reg_predictions, test_outputs);
fprintf("multivariate_gen_lin_reg_avg_rsme: %.4f\n", multivariate_gen_lin_reg_avg_rsme);