function applied = filter_apply(image, filter, flag)
 if flag == 0
    applied = imfilter(image, filter);
 elseif flag == 1
     applied = imfilter(image, filter, 'conv');
 end
end