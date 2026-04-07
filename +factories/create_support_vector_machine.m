function [reg] = create_support_vector_machine(inputs, outputs) 
    %{
        "KernelFunction", "gaussian" -> Use a curved/nonlinear model (Guassian kernel), not just a straight line.
        "KernelScale", "auto" -> Automatically pick how wide the Guassian curve is from the data.
        "Standardize", true -> Scale each input using z-score before training.
    %}
    DO_1_reg = fitrsvm(inputs, utils.get_output_col(outputs, "DO_1"), "KernelFunction", "gaussian", "KernelScale", "auto", "Standardize", true);
    DO_2_reg = fitrsvm(inputs, utils.get_output_col(outputs, "DO_2"), "KernelFunction", "gaussian", "KernelScale", "auto", "Standardize", true);
    DO_3_reg = fitrsvm(inputs, utils.get_output_col(outputs, "DO_3"), "KernelFunction", "gaussian", "KernelScale", "auto", "Standardize", true);
    NO_3_reg = fitrsvm(inputs, utils.get_output_col(outputs,"NO_3"), "KernelFunction", "gaussian", "KernelScale", "auto", "Standardize", true);
    NH4_reg = fitrsvm(inputs, utils.get_output_col(outputs, "NH4"), "KernelFunction", "gaussian", "KernelScale", "auto", "Standardize", true);

    reg = @(x) [predict(DO_1_reg, x), predict(DO_2_reg, x), predict(DO_3_reg, x), predict(NO_3_reg, x), predict(NH4_reg, x)];
end
