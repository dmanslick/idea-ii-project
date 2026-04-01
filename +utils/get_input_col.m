function [col] = get_input_col(inputs, key)
    switch key
        case "Q_inf"
            col = inputs(:, 1);
        case "Q_air_1"
            col = inputs(:, 2);
        case "Q_air_2"
            col = inputs(:, 3);
        case "Q_air_3"
            col = inputs(:, 4);
        case "Q_air_4"
            col = inputs(:, 5);
        case "Q_air_5"
            col = inputs(:, 6);
        case "Temp"
            col = inputs(:, 7);
        otherwise
            error("Invalid key: %s", key);
    end
end