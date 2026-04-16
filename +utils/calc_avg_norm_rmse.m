function [avg_norm_rmse] = calc_avg_norm_rmse(predicted_outputs, actual_outputs) 
    do1_error = predicted_outputs(:, 1) - actual_outputs(:, 1);
    do2_error = predicted_outputs(:, 2) - actual_outputs(:, 2);
    do3_error = predicted_outputs(:, 3) - actual_outputs(:, 3);
    no3_error = predicted_outputs(:, 4) - actual_outputs(:, 4);
    nh4_error = predicted_outputs(:, 5) - actual_outputs(:, 5);

    do1_rmse = sqrt(mean(do1_error .^ 2));
    do2_rmse = sqrt(mean(do2_error .^ 2));
    do3_rmse = sqrt(mean(do3_error .^ 2));
    no3_rmse = sqrt(mean(no3_error .^ 2));
    nh4_rmse = sqrt(mean(nh4_error .^ 2));

    do1_range = max(actual_outputs(:, 1)) - min(actual_outputs(:, 1));
    do2_range = max(actual_outputs(:, 2)) - min(actual_outputs(:, 2));
    do3_range = max(actual_outputs(:, 3)) - min(actual_outputs(:, 3));
    no3_range = max(actual_outputs(:, 4)) - min(actual_outputs(:, 4));
    nh4_range = max(actual_outputs(:, 5)) - min(actual_outputs(:, 5));

    do1_norm_rmse = do1_rmse / do1_range;
    do2_norm_rmse = do2_rmse / do2_range;
    do3_norm_rmse = do3_rmse / do3_range;
    no3_norm_rmse = no3_rmse / no3_range;
    nh4_norm_rmse = nh4_rmse / nh4_range;

    avg_norm_rmse = (do1_norm_rmse + do2_norm_rmse + do3_norm_rmse + no3_norm_rmse + nh4_norm_rmse) / 5;
end