function chosen_filter = filter_choose(filters)
    if strcmp(filters, "average")
        chosen_filter = fspecial(filters, 2);
    elseif strcmp(filters, "disk")
        chosen_filter = fspecial(filters, 3);
    elseif strcmp(filters, "laplacian")
        chosen_filter = fspecial(filters, 0.5);
    elseif strcmp(filters, "gaussian")
        chosen_filter = fspecial(filters, [5 5], 2);
    elseif strcmp(filters, "motion")
        chosen_filter = fspecial(filters, 20, 30);
    end
end

