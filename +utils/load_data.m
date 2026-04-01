function [training_data, testing_data] = load_data()
    training_data = readtable('./data/training.csv');
    testing_data = readtable('./data/testing.csv');
end