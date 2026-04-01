clear();
clc();

[training_data, testing_data] = load_data();
[inputs, outputs] = get_inputs_outputs(training_data);
