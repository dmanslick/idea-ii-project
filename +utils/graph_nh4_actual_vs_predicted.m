function graph_nh4_actual_vs_predicted(test_outputs, multivariate_lin_reg_predictions, guassian_proc_reg_predictions)
    nh4_actual = utils.get_output_col(test_outputs, "NH4");
    nh4_multivariate_lin_pred = utils.get_output_col(multivariate_lin_reg_predictions, "NH4");
    nh4_guassian_proc_pred = utils.get_output_col(guassian_proc_reg_predictions, "NH4");

    figure("Name", "NH4 Actual vs Predicted");
    tiledlayout(2, 1);

    nexttile;
    plot(nh4_actual, "LineWidth", 1.5, "DisplayName", "Actual NH4");
    hold on;
    plot(nh4_multivariate_lin_pred, "--", "LineWidth", 1.5, "DisplayName", "Multivariate Linear Predicted NH4");
    hold off;
    title("NH4: Actual vs Multivariate Linear Predicted");
    xlabel("Sample Index");
    ylabel("NH4");
    legend("Location", "best");
    grid on;

    nexttile;
    plot(nh4_actual, "LineWidth", 1.5, "DisplayName", "Actual NH4");
    hold on;
    plot(nh4_guassian_proc_pred, "--", "LineWidth", 1.5, "DisplayName", "Guassian Process Predicted NH4");
    hold off;
    title("NH4: Actual vs Guassian Process Predicted");
    xlabel("Sample Index");
    ylabel("NH4");
    legend("Location", "best");
    grid on;
end
