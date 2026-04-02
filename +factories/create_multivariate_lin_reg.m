function [reg] = create_multivariate_lin_reg(inputs, outputs) 
    DO_1_reg = regress(utils.get_output_col(outputs, "DO_1"), inputs);
    DO_2_reg = regress(utils.get_output_col(outputs, "DO_2"), inputs);
    DO_3_reg = regress(utils.get_output_col(outputs, "DO_3"), inputs);
    NO_3_reg = regress(utils.get_output_col(outputs,"NO_3"), inputs);
    NH4_reg = regress(utils.get_output_col(outputs, "NH4"), inputs);

    reg = @(x) x * [DO_1_reg, DO_2_reg, DO_3_reg, NO_3_reg, NH4_reg];
end