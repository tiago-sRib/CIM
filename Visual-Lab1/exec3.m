clear, clc, close all;
addpath(".\images\");

im1 = imread('floresVermelhas.bmp');
[line,col]=size(im1(:,:,1));

im2 = imread('nenufares.bmp');
[line,col]=size(im2(:,:,1));

%-----------------------exec3.1.1----------------------------%
    
filters = {"average", "disk", "laplacian", "gaussian", "motion"};

for i=1:length(filters)
    chosen_filter = filter_choose(filters{i});
    applied1 = filter_apply(im1, chosen_filter, 0);
    applied2 = filter_apply(im2, chosen_filter, 0);
    fig = figure(i);
    subplot(2, 2, 1); imshow(im1); title('Original Image');
    subplot(2, 2, 2); imshow(applied1); title('Filtered with ' + filters{i} + ' filter');
    subplot(2, 2, 3); imshow(im2); title('Original Image');
    subplot(2, 2, 4); imshow(applied2); title('Filtered with ' + filters{i} + ' filter');
    saveas(fig, sprintf("plots_exec3/ex311_F%d_%s.pdf", i, filters{i}))
end

% %-----------------------exec3.1.2----------------------------%

filters2 = {"average", "gaussian"};
for i=1:length(filters2)
    chosen_filter = filter_choose2(filters2{i});
    applied1 = filter_apply(im1, chosen_filter, 0);
    applied2 = filter_apply(im2, chosen_filter, 0);
    fig = figure(i+5);
    subplot(2, 2, 1); imshow(im1); title('Original Image');
    subplot(2, 2, 2); imshow(applied1); title('Filtered with ' + filters2{i} + ' filter');
    subplot(2, 2, 3); imshow(im2); title('Original Image');
    subplot(2, 2, 4); imshow(applied2); title('Filtered with ' + filters2{i} + ' filter');
    saveas(fig, sprintf("plots_exec3/ex312_F%d_%s.pdf", i, filters2{i}));
end

%-----------------------exec3.2.1----------------------------%

noise1 = imread('noise1.jpg');
[line,col]=size(noise1(:,:,1));

noise2 = imread('noise2.jpg');
[line,col]=size(noise2(:,:,1));

mean3x3 = ones(3,3) / 9;
mean5x5 = ones(5,5) / 25;

noise1_mean3x3 = filter_apply(noise1, mean3x3, 1);
noise1_mean5x5 = filter_apply(noise1, mean5x5, 1);
noise2_mean3x3 = filter_apply(noise2, mean3x3, 1);
noise2_mean5x5 = filter_apply(noise2, mean5x5, 1);
noise = {noise1, noise1_mean3x3, noise1_mean5x5, noise2, noise2_mean3x3, noise2_mean5x5};

for j=1:2
    fig = figure(j+7);
    if (j == 1)             
        subplot(2, 2, [1, 2]); imshow(noise{j}); title('Original Noise Image');
        subplot(2, 2, 3); imshow(noise{j+1}); title('Mean3x3');
        subplot(2, 2, 4); imshow(noise{j+2}); title('Mean5x5');
    else 
        subplot(2, 2, [1, 2]); imshow(noise{j+2}); title('Original Noise Image');
        subplot(2, 2, 3); imshow(noise{j+3}); title('Mean3x3');
        subplot(2, 2, 4); imshow(noise{j+4}); title('Mean5x5');
    end
    saveas(fig, sprintf("plots_exec3/ex321_%d.pdf", j));
end

%-----------------------exec3.2.2----------------------------%

noise1_median = medfilt2(noise1);
noise2_median = medfilt2(noise2);
fig = figure();
subplot(2, 2, 1); imshow(noise1); title('Original Noise1 Image');
subplot(2, 2, 2); imshow(noise1_median); title('Noise1 Filtered with  Median Filter');
subplot(2, 2, 3); imshow(noise2); title('Original Noise2 Image');
subplot(2, 2, 4); imshow(noise2_median); title('Noise2 Filtered with Median Filter');
saveas(fig, "plots_exec3/ex322.pdf");

%-----------------------exec3.2.3----------------------------%

casa1 = imread('casa1.jpg');
[line,col]=size(noise1(:,:,1));

casa2 = imread('casa2.jpg');
[line,col]=size(noise2(:,:,1));

camtif = imread('cameraman.tif');
[line,col]=size(noise2(:,:,1));

sobel_op1 = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
sobel_op2 = rot90(sobel_op1);
% 
casa1_sobel1 = filter_apply(casa1, sobel_op1, 1);
casa1_sobel2 = filter_apply(casa1, sobel_op2, 1);
casa2_sobel1 = filter_apply(casa2, sobel_op1, 1);
casa2_sobel2 = filter_apply(casa2, sobel_op2, 1);
camtif_sobel1 = filter_apply(camtif, sobel_op1, 1);
camtif_sobel2 = filter_apply(camtif, sobel_op2, 1);

casa1_mag_sobel = mag_calc(casa1_sobel1, casa1_sobel2);
casa2_mag_sobel = mag_calc(casa2_sobel1, casa2_sobel2);
camtif_mag_sobel = mag_calc(camtif_sobel1, camtif_sobel2);

fig = figure();
subplot(2, 2, 1); imshow(casa1); title('Original Casa1 Image');
subplot(2, 2, 2); imshow(casa1_mag_sobel); title('Convolution with Sobel operators');
subplot(2, 2, 3); imshow(casa1_sobel1); title('First Operator');
subplot(2, 2, 4); imshow(casa1_sobel2); title('Second Operator');
saveas(fig, "plots_exec3/ex323_1.pdf");

fig = figure();
subplot(2, 2, 1); imshow(casa2); title('Original Casa2 Image');
subplot(2, 2, 2); imshow(casa2_mag_sobel); title('Convolution with Sobel operators');
subplot(2, 2, 3); imshow(casa2_sobel1); title('First Operator');
subplot(2, 2, 4); imshow(casa2_sobel2); title('Second Operator');
saveas(fig, "plots_exec3/ex323_2.pdf");

fig = figure();
subplot(2, 2, 1); imshow(camtif); title('Original Casa1 Image');
subplot(2, 2, 2); imshow(camtif_mag_sobel); title('Convolution with Sobel operators');
subplot(2, 2, 3); imshow(camtif_sobel1); title('First Operator');
subplot(2, 2, 4); imshow(camtif_sobel2); title('Second Operator');
saveas(fig, "plots_exec3/ex323_3.pdf");
%-----------------------exec3.2.4----------------------------%

prewitt_op1 = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
prewitt_op2 = rot90(prewitt_op1);

casa1_prewitt1 = filter_apply(casa1, prewitt_op1, 1);
casa1_prewitt2 = filter_apply(casa1, prewitt_op2, 1);
casa2_prewitt1 = filter_apply(casa2, prewitt_op1, 1);
casa2_prewitt2 = filter_apply(casa2, prewitt_op2, 1);
camtif_prewitt1 = filter_apply(camtif, prewitt_op1, 1);
camtif_prewitt2 = filter_apply(camtif, prewitt_op2, 1);

casa1_mag = mag_calc(casa1_prewitt1, casa1_prewitt2);
casa2_mag = mag_calc(casa2_prewitt1, casa2_prewitt2);
camtif_mag = mag_calc(camtif_prewitt1, camtif_prewitt2);

fig = figure();
subplot(2, 2, 1); imshow(casa1); title('Original Casa1 Image');
subplot(2, 2, 2); imshow(casa1_mag); title('Convolution with Prewitt operators');
subplot(2, 2, 3); imshow(casa1_prewitt1); title('First Operator');
subplot(2, 2, 4); imshow(casa1_prewitt2); title('Second Operator');
saveas(fig, "plots_exec3/ex324_1.pdf");

fig = figure();
subplot(2, 2, 1); imshow(casa2); title('Original Casa2 Image');
subplot(2, 2, 2); imshow(casa2_mag); title('Convolution with Prewitt operators');
subplot(2, 2, 3); imshow(casa2_prewitt1); title('First Operator');
subplot(2, 2, 4); imshow(casa2_prewitt2); title('Second Operator');
saveas(fig, "plots_exec3/ex324_2.pdf");

fig = figure();
subplot(2, 2, 1); imshow(camtif); title('Original Casa1 Image');
subplot(2, 2, 2); imshow(camtif_mag); title('Convolution with Prewitt operators');
subplot(2, 2, 3); imshow(camtif_prewitt1); title('First Operator');
subplot(2, 2, 4); imshow(camtif_prewitt2); title('Second Operator');
saveas(fig, "plots_exec3/ex324_3.pdf");

%-----------------------exec3.3----------------------------%
sigma = [1, 2];
threshold = [0.1, 0.3];
canny = cell(length(sigma), length(threshold));
for i=1:length(sigma)
    for k=1:length(threshold)
        sigma_value = sigma(i);
        threshold_value = threshold(k);
        canny{i, k} = edge(camtif, "canny", threshold_value, sigma_value);
    end
end

fig = figure();
title_str1 = sprintf('Sigma = %d, Treshold = %.2f', sigma(1), threshold(1));
title_str2 = sprintf('Sigma = %d, Treshold = %.2f', sigma(1), threshold(2));
title_str3 = sprintf('Sigma = %d, Treshold = %.2f', sigma(2), threshold(1));
title_str4 = sprintf('Sigma = %d, Treshold = %.2f', sigma(2), threshold(2));

subplot(2, 2, 1); imshow(canny{1, 1}); title(title_str1);
subplot(2, 2, 2); imshow(canny{1, 2}); title(title_str2);
subplot(2, 2, 3); imshow(canny{2, 1}); title(title_str3);
subplot(2, 2, 4); imshow(canny{2, 2}); title(title_str4);
saveas(fig, "plots_exec3/ex33.pdf");
