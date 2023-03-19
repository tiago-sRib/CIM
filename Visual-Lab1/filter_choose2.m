function chosen_filter = filter_choose2(filters)
    if strcmp(filters, "average")
        chosen_filter = fspecial(filters, 10);
    elseif strcmp(filters, "gaussian")
        chosen_filter = fspecial(filters, [10 10], 2);
    end
end