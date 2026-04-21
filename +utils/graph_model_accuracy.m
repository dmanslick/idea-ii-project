function graph_model_accuracy(training_ratio, model_names, avg_norm_rmses)
    percent_rmses = avg_norm_rmses * 100;
    [sorted_rmses, order] = sort(percent_rmses, "ascend");
    sorted_names = model_names(order);

    figure("Name", "Model Accuracy Comparison");
    barh(sorted_rmses, "FaceColor", [0.2, 0.45, 0.75]);
    ax = gca;
    ax.YDir = "reverse";
    ax.YTick = 1:numel(sorted_names);
    ax.YTickLabel = sorted_names;
    ax.FontSize = 11;

    title("Model Accuracy (Average Normalized RMSE):" + training_ratio * 10 + "% Training Data");
    xlabel("Average Normalized RMSE (%)");
    ylabel("Model");
    grid on;

    max_rmse = max(sorted_rmses);
    x_pad = max_rmse * 0.03;
    if max_rmse == 0
        x_pad = 0.1;
        xlim([0, 1]);
    else
        xlim([0, max_rmse + (3 * x_pad)]);
    end

    for i = 1:numel(sorted_rmses)
        text(sorted_rmses(i) + x_pad, i, sprintf("%.2f%%", sorted_rmses(i)), ...
            "VerticalAlignment", "middle", "FontWeight", "bold");
    end
end
