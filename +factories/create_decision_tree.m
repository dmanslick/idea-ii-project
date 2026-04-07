function [reg] = create_decision_tree(inputs, outputs) 
    DO_1_reg = fitrtree(inputs, utils.get_output_col(outputs, "DO_1"));
    DO_2_reg = fitrtree(inputs, utils.get_output_col(outputs, "DO_2"));
    DO_3_reg = fitrtree(inputs, utils.get_output_col(outputs, "DO_3"));
    NO_3_reg = fitrtree(inputs, utils.get_output_col(outputs,"NO_3"));
    NH4_reg = fitrtree(inputs, utils.get_output_col(outputs, "NH4"));

    reg = @(x) [predict(DO_1_reg, x), predict(DO_2_reg, x), predict(DO_3_reg, x), predict(NO_3_reg, x), predict(NH4_reg, x)];
end