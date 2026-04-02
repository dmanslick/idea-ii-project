function [reg] = create_multivariate_gen_lin_reg(inputs, outputs) 
    DO_1_reg = fitglm(inputs, utils.get_output_col(outputs, "DO_1"));
    DO_2_reg = fitglm(inputs, utils.get_output_col(outputs, "DO_2"));
    DO_3_reg = fitglm(inputs, utils.get_output_col(outputs, "DO_3"));
    NO_3_reg = fitglm(inputs, utils.get_output_col(outputs,"NO_3"));
    NH4_reg = fitglm(inputs, utils.get_output_col(outputs, "NH4"));

    reg = @(x) [predict(DO_1_reg, x), predict(DO_2_reg, x), predict(DO_3_reg, x), predict(NO_3_reg, x), predict(NH4_reg, x)];
end