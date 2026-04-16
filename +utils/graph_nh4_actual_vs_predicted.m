function graph_nh4_actual_vs_predicted(test_outputs, model_predictions, model_name)
    nh4_actual = utils.get_output_col(test_outputs, "NH4");
    nh4_actual = nh4_actual(:);
    sample_idx = 1:numel(nh4_actual);
    nh4_pred = utils.get_output_col(model_predictions, "NH4");
    nh4_pred = nh4_pred(:);
    residual = nh4_pred - nh4_actual;

    mae = mean(abs(residual));
    rmse = sqrt(mean(residual .^ 2));

    figure("Name", "NH4 Actual vs Predicted - " + model_name);
    tiledlayout(2, 1, "TileSpacing", "compact", "Padding", "compact");

    nexttile;
    plot(sample_idx, nh4_actual, "-", "LineWidth", 1.8, "Color", [0 0.4470 0.7410], "DisplayName", "Actual NH4");
    hold on;
    plot(sample_idx, nh4_pred, "-", "LineWidth", 1.4, "Color", [0.8500 0.3250 0.0980], "DisplayName", "Predicted NH4");
    hold off;

    title("NH4: " + model_name);
    xlabel("Sample Index");
    ylabel("NH4");
    legend("Location", "best");
    ylim("auto");
    grid on;

    nexttile;
    yline(0, "k-", "LineWidth", 1.0, "HandleVisibility", "off");
    hold on;
    stem(sample_idx, residual, "filled", "MarkerSize", 3, "LineWidth", 0.8, "Color", [1 0 1], "DisplayName", "Residual (Predicted - Actual)");
    hold off;
    xlabel("Sample Index");
    ylabel("Residual");
    title(sprintf("Residuals (MAE = %.4f, RMSE = %.4f)", mae, rmse));
    legend("Location", "best");
    ylim("auto");
    grid on;
end
