function [inputs, outputs] = get_inputs_outputs(data) 
    %{
        mat(:, 1) -> Q_inf
        mat(:, 2) -> Q_air_1
        mat(:, 3) -> Q_air_2
        mat(:, 4) -> Q_air_3
        mat(:, 5) -> Q_air_4
        mat(:, 6) -> Q_air_5
        mat(:, 7) -> Temp
    %}
    input_cols = ["Q_inf", "Q_air_1", "Q_air_2", "Q_air_3", "Q_air_4", "Q_air_5", "Temp"];
    inputs = data{:, input_cols};

    %{
        mat(:, 1) -> DO_1
        mat(:, 2) -> DO_2
        mat(:, 3) -> DO_3
        mat(:, 4) -> NO_3
        mat(:, 5) -> NH4
    %}
    output_cols = ["DO_1", "DO_2", "DO_3", "NO3", "NH4"];
    outputs = data{:, output_cols};
end
