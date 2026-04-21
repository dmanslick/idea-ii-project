function [training_data, testing_data] = split_and_load_data(training_ratio)
    all_data = readtable('./data/all_data.csv');
    total_rows = height(all_data);
    training_rows = floor(total_rows * training_ratio);

    training_data = all_data(1:training_rows, :);
    testing_data = all_data(training_rows + 1:end, :);
end
