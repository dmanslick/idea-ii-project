function [reg, run_time] = create_generalized_add_model(inputs, outputs) 
    start_seconds = posixtime(datetime('now'));

    DO_1_reg = fitrgam(inputs, utils.get_output_col(outputs, "DO_1"));
    DO_2_reg = fitrgam(inputs, utils.get_output_col(outputs, "DO_2"));
    DO_3_reg = fitrgam(inputs, utils.get_output_col(outputs, "DO_3"));
    NO_3_reg = fitrgam(inputs, utils.get_output_col(outputs, "NO_3"));
    NH4_reg = fitrgam(inputs, utils.get_output_col(outputs, "NH4"));

    end_seconds = posixtime(datetime('now'));

    reg = @(x) [predict(DO_1_reg, x), predict(DO_2_reg, x), predict(DO_3_reg, x), predict(NO_3_reg, x), predict(NH4_reg, x)];
    run_time = end_seconds - start_seconds;
end