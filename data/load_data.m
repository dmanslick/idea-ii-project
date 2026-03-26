function [training_data, testing_data] = load_data()
    training_data = readmatrix('./training.csv');
    testing_data = readmatrix('./testing.csv');
end