function [col] = get_output_col(outputs, key)
    switch key
        case "DO_1"
            col = outputs(:, 1);
        case "DO_2"
            col = outputs(:, 2);
        case "DO_3"
            col = outputs(:, 3);
        case "NO_3"
            col = outputs(:, 4);
        case "NH4"
            col = outputs(:, 5);
        otherwise
            error("Invalid key: %s", key);
    end
end