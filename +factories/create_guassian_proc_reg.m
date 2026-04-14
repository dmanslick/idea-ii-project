function [reg, run_time] = create_guassian_proc_reg(inputs, outputs)
    start_seconds = posixtime(datetime('now'));

    % "Standardize", true -> Scale each input using z-score before training.
    DO_1_reg = fitrgp(inputs, utils.get_output_col(outputs, "DO_1"), "Standardize", true);
    DO_2_reg = fitrgp(inputs, utils.get_output_col(outputs, "DO_2"), "Standardize", true);
    DO_3_reg = fitrgp(inputs, utils.get_output_col(outputs, "DO_3"), "Standardize", true);
    NO_3_reg = fitrgp(inputs, utils.get_output_col(outputs,"NO_3"), "Standardize", true);
    NH4_reg = fitrgp(inputs, utils.get_output_col(outputs, "NH4"), "Standardize", true);

    end_seconds = posixtime(datetime('now'));

    reg = @(x) [predict(DO_1_reg, x), predict(DO_2_reg, x), predict(DO_3_reg, x), predict(NO_3_reg, x), predict(NH4_reg, x)];
    run_time = end_seconds - start_seconds;
end
