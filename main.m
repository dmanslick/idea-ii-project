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

guassian_proc_reg = factories.create_guassian_proc_reg(training_inputs, training_outputs);
guassian_proc_reg_predictions = guassian_proc_reg(test_inputs);

support_vector_machine = factories.create_support_vector_machine(training_inputs, training_outputs);
support_vector_machine_predictions = support_vector_machine(test_inputs);

decision_tree = factories.create_decision_tree(training_inputs, training_outputs);
decision_tree_predictions = decision_tree(test_inputs);

ensemble_of_learners = factories.create_ensemble_of_learners(training_inputs, training_outputs);
ensemble_of_learners_predictions = ensemble_of_learners(test_inputs);

generalized_add_model = factories.create_generalized_add_model(training_inputs, training_outputs);
generalized_add_model_predictions = generalized_add_model(test_inputs);

% calculate and print average RMSE's for different regressions

multivariate_lin_reg_avg_rmse = utils.calc_avg_norm_rmse(multivariate_lin_reg_predictions, test_outputs);
fprintf("multivariate_lin_reg_avg_rmse: %.4f\n", multivariate_lin_reg_avg_rmse);

multivariate_gen_lin_reg_avg_rmse = utils.calc_avg_norm_rmse(multivariate_gen_lin_reg_predictions, test_outputs);
fprintf("multivariate_gen_lin_reg_avg_rmse: %.4f\n", multivariate_gen_lin_reg_avg_rmse);

guassian_proc_reg_avg_rmse = utils.calc_avg_norm_rmse(guassian_proc_reg_predictions, test_outputs);
fprintf("guassian_proc_reg_avg_rmse: %.4f\n", guassian_proc_reg_avg_rmse);

support_vector_machine_avg_rmse = utils.calc_avg_norm_rmse(support_vector_machine_predictions, test_outputs);
fprintf("support_vector_machine_avg_rmse: %.4f\n", support_vector_machine_avg_rmse);

decision_tree_avg_rmse = utils.calc_avg_norm_rmse(decision_tree_predictions, test_outputs);
fprintf("decision_tree_avg_rmse: %.4f\n", decision_tree_avg_rmse);

ensemble_of_learners_avg_rmse = utils.calc_avg_norm_rmse(ensemble_of_learners_predictions, test_outputs);
fprintf("ensemble_of_learners_avg_rmse: %.4f\n", ensemble_of_learners_avg_rmse);

generalized_add_model_avg_rmse = utils.calc_avg_norm_rmse(generalized_add_model_predictions, test_outputs);
fprintf("generalized_add_model_avg_rmse: %.4f\n", generalized_add_model_avg_rmse);