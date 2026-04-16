% GitHub Repo: https://github.com/dmanslick/idea-ii-project

clear();
clc();

fprintf("Start...\n")

% load data and get input and output data as matricies

[training_data, testing_data] = utils.load_data();
[training_inputs, training_outputs] = utils.get_inputs_outputs(training_data);
[test_inputs, test_outputs] = utils.get_inputs_outputs(testing_data);

% create regressions

[multivariate_lin_reg, multivariate_lin_reg_run_time] = factories.create_multivariate_lin_reg(training_inputs, training_outputs);
multivariate_lin_reg_predictions = multivariate_lin_reg(test_inputs);

[multivariate_gen_lin_reg, multivariate_gen_lin_reg_run_time] = factories.create_multivariate_gen_lin_reg(training_inputs, training_outputs);
multivariate_gen_lin_reg_predictions = multivariate_gen_lin_reg(test_inputs);

[guassian_proc_reg, guassian_proc_reg_run_time] = factories.create_guassian_proc_reg(training_inputs, training_outputs);
guassian_proc_reg_predictions = guassian_proc_reg(test_inputs);

[support_vector_machine, support_vector_machine_run_time] = factories.create_support_vector_machine(training_inputs, training_outputs);
support_vector_machine_predictions = support_vector_machine(test_inputs);

[decision_tree, decision_tree_run_time] = factories.create_decision_tree(training_inputs, training_outputs);
decision_tree_predictions = decision_tree(test_inputs);

[ensemble_of_learners, ensemble_of_learners_run_time] = factories.create_ensemble_of_learners(training_inputs, training_outputs);
ensemble_of_learners_predictions = ensemble_of_learners(test_inputs);

[generalized_add_model, generalized_add_model_run_time] = factories.create_generalized_add_model(training_inputs, training_outputs);
generalized_add_model_predictions = generalized_add_model(test_inputs);

% calculate and print average RMSE's for different regressions

fprintf("--------------------------------------------\n");
fprintf("          Average Normalized RMSEs          \n");
fprintf("--------------------------------------------\n");

multivariate_lin_reg_avg_rmse = utils.calc_avg_norm_rmse(multivariate_lin_reg_predictions, test_outputs);
fprintf("Multivariate Linear Regression: %.4f\n", multivariate_lin_reg_avg_rmse);

multivariate_gen_lin_reg_avg_rmse = utils.calc_avg_norm_rmse(multivariate_gen_lin_reg_predictions, test_outputs);
fprintf("Multivariate Generalized Linear Regression: %.4f\n", multivariate_gen_lin_reg_avg_rmse);

guassian_proc_reg_avg_rmse = utils.calc_avg_norm_rmse(guassian_proc_reg_predictions, test_outputs);
fprintf("Guassian Process Regression: %.4f\n", guassian_proc_reg_avg_rmse);

support_vector_machine_avg_rmse = utils.calc_avg_norm_rmse(support_vector_machine_predictions, test_outputs);
fprintf("Support Vector Machine: %.4f\n", support_vector_machine_avg_rmse);

decision_tree_avg_rmse = utils.calc_avg_norm_rmse(decision_tree_predictions, test_outputs);
fprintf("Decision Tree: %.4f\n", decision_tree_avg_rmse);

ensemble_of_learners_avg_rmse = utils.calc_avg_norm_rmse(ensemble_of_learners_predictions, test_outputs);
fprintf("Ensemble of Learners: %.4f\n", ensemble_of_learners_avg_rmse);

generalized_add_model_avg_rmse = utils.calc_avg_norm_rmse(generalized_add_model_predictions, test_outputs);
fprintf("Generalized Additive Model: %.4f\n", generalized_add_model_avg_rmse);

% print training times for different regressions

fprintf("\n")
fprintf("--------------------------------------------\n");
fprintf("           Model Training Times             \n");
fprintf("--------------------------------------------\n");

fprintf("Multivariate Linear Regression: %.4f seconds\n", multivariate_lin_reg_run_time);
fprintf("Multivariate Generalized Linear Regression: %.4f seconds\n", multivariate_gen_lin_reg_run_time);
fprintf("Guassian Process Regression: %.4f seconds\n", guassian_proc_reg_run_time);
fprintf("Support Vector Machine: %.4f seconds\n", support_vector_machine_run_time);
fprintf("Decision Tree: %.4f seconds\n", decision_tree_run_time);
fprintf("Ensemble of Learners: %.4f seconds\n", ensemble_of_learners_run_time);
fprintf("Generalized Additive Model: %.4f seconds\n", generalized_add_model_run_time);

% visualize model accuracy using their RMSEs

model_names = ["Multivariate Linear", "Multivariate GLM", "Gaussian Process", "Support Vector Machine", "Decision Tree", "Ensemble of Learners", "Generalized Additive Model"];
avg_norm_rmses = [multivariate_lin_reg_avg_rmse, multivariate_gen_lin_reg_avg_rmse, guassian_proc_reg_avg_rmse, support_vector_machine_avg_rmse, decision_tree_avg_rmse, ensemble_of_learners_avg_rmse, generalized_add_model_avg_rmse];
utils.graph_model_accuracy(model_names, avg_norm_rmses);

% visualize NH4 actual vs predicted for each model separately
utils.graph_nh4_actual_vs_predicted(test_outputs, multivariate_lin_reg_predictions, "Multivariate Linear Regression");
utils.graph_nh4_actual_vs_predicted(test_outputs, multivariate_gen_lin_reg_predictions, "Multivariate Generalized Linear Regression");
utils.graph_nh4_actual_vs_predicted(test_outputs, guassian_proc_reg_predictions, "Guassian Process Regression");
utils.graph_nh4_actual_vs_predicted(test_outputs, support_vector_machine_predictions, "Support Vector Machine");
utils.graph_nh4_actual_vs_predicted(test_outputs, decision_tree_predictions, "Decision Tree");
utils.graph_nh4_actual_vs_predicted(test_outputs, ensemble_of_learners_predictions, "Ensemble of Learners");
utils.graph_nh4_actual_vs_predicted(test_outputs, generalized_add_model_predictions, "Generalized Additive Model");
