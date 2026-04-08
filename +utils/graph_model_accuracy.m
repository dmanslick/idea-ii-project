function graph_model_accuracy(model_names, avg_norm_rmses)
    [sorted_rmses, order] = sort(avg_norm_rmses, "ascend");
    sorted_names = model_names(order);

    figure("Name", "Model Accuracy Comparison");
    barh(sorted_rmses, "FaceColor", [0.2, 0.45, 0.75]);
    ax = gca;
    ax.YDir = "reverse";
    ax.YTick = 1:numel(sorted_names);
    ax.YTickLabel = sorted_names;

    title("Model Accuracy (Average Normalized RMSE)");
    xlabel("Average Normalized RMSE (%)");
    ylabel("Model");
    grid on;

    x_pad = max(sorted_rmses) * 0.02;
    if x_pad == 0
        x_pad = 0.1;
    end

    for i = 1:numel(sorted_rmses)
        text(sorted_rmses(i) + x_pad, i, sprintf("%.3f", sorted_rmses(i)), ...
            "VerticalAlignment", "middle");
    end
end
