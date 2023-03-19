clc, clear, close all;
addpath(".\images\");

%-----------------------exec1.1.1----------------------------%
im1 = imread('images\floresVermelhas.bmp');
[line,col]=size(im1(:,:,1));

im2 = imread('images\folhasVerdes.bmp');
[line,col]=size(im2(:,:,1));

im3 = imread('images\testRGB.bmp');
[line,col]=size(im3(:,:,1));

%-----------------------exec1.1.2----------------------------%

r1 = im1(:,:,1);
b1 = im1(:,:,2);
g1 = im1(:,:,3);

r2 = im2(:,:,1);
b2 = im2(:,:,2);
g2 = im2(:,:,3);

r3 = im3(:,:,1);
b3 = im3(:,:,2);
g3 = im3(:,:,3);

%-----------------------exec1.1.3----------------------------%

im1_hsv = rgb2hsv(im1);
im2_hsv = rgb2hsv(im2);
im3_hsv = rgb2hsv(im3);

%-----------------------exec1.1.4----------------------------%

h1 = im1_hsv(:,:,1);
s1 = im1_hsv(:,:,2);
v1 = im1_hsv(:,:,3);

h2 = im2_hsv(:,:,1);
s2 = im2_hsv(:,:,2);
v2 = im2_hsv(:,:,3);

h3 = im3_hsv(:,:,1);
s3 = im3_hsv(:,:,2);
v3 = im3_hsv(:,:,3);

%-----------------------Plots----------------------------%

fig_rgb1 = figure;
fig_rgb1.Name = "RGB - 1";
% Display the original image
subplot(2,3,2), imshow(im1), title('Flores Vermelhas');

% Display the three components
subplot(2,3,4), imshow(r1), title('Red');
subplot(2,3,5), imshow(b1), title('Blue');
subplot(2,3,6), imshow(g1), title('Green');
saveas(fig_rgb1, "plots_exec1/RGB-1.pdf");

fig_rgb2 = figure;
fig_rgb2.Name = "RGB - 2";
% Display the original image
subplot(2,3,2), imshow(im2), title('Flores Verdes');

% Display the three components
subplot(2,3,4), imshow(r2), title('Red');
subplot(2,3,5), imshow(b2), title('Blue');
subplot(2,3,6), imshow(g2), title('Green');
saveas(fig_rgb2, "plots_exec1/RGB-2.pdf");

fig_rgb3 = figure;
fig_rgb3.Name = "RGB - 3";
% Display the original image
subplot(2,3,2), imshow(im3), title('testeRGB');

% Display the three components
subplot(2,3,4), imshow(r3), title('Red');
subplot(2,3,5), imshow(b3), title('Blue');
subplot(2,3,6), imshow(g3), title('Green');
saveas(fig_rgb3, "plots_exec1/RGB-3.pdf");

fig_hsv1 = figure;
fig_hsv1.Name = 'HSV - 1';
% Display the original image
subplot(2,3,2), imshow(im1_hsv), title('Flores Vermelhas HSV');

% Display the three components
subplot(2,3,4), imshow(h1), title('Hue');
subplot(2,3,5), imshow(s1), title('Saturation');
subplot(2,3,6), imshow(v1), title('Value');
saveas(fig_hsv1, "plots_exec1/HSV-1.pdf");

fig_hsv2 = figure;
fig_hsv2.Name = 'HSV - 2';
% Display the original image
subplot(2,3,2), imshow(im2_hsv), title('Flores Verdes HSV');

% Display the three components
subplot(2,3,4), imshow(h2), title('Hue');
subplot(2,3,5), imshow(s2), title('Saturation');
subplot(2,3,6), imshow(v2), title('Value');
saveas(fig_hsv2, "plots_exec1/HSV-2.pdf");

fig_hsv3 = figure;
fig_hsv3.Name = 'HSV - 3';
% Display the original image
subplot(2,3,2), imshow(im3_hsv), title('testeRGB HSV');

% Display the three components
subplot(2,3,4), imshow(h3), title('Hue');
subplot(2,3,5), imshow(s3), title('Saturation');
subplot(2,3,6), imshow(v3), title('Value');
saveas(fig_hsv3, "plots_exec1/HSV-3.pdf");

%-----------------------exec1.2----------------------------%

im1_ycbcr = rgb2ycbcr(im1);
im2_ycbcr = rgb2ycbcr(im2);
im3_ycbcr = rgb2ycbcr(im3);

y1 = im1_ycbcr(:,:,1);
cb1 = im1_ycbcr(:,:,2);
cr1 = im1_ycbcr(:,:,3);

y2 = im2_ycbcr(:,:,1);
cb2 = im2_ycbcr(:,:,2);
cr2 = im2_ycbcr(:,:,3);

y3 = im3_ycbcr(:,:,1);
cb3 = im3_ycbcr(:,:,2);
cr3 = im3_ycbcr(:,:,3);

fig_YCbCr1 = figure;
fig_YCbCr1.Name = 'YCbCr - 1';
% Display the original image
subplot(2,3,2), imshow(im1_ycbcr), title('Flores Vermelhas YCbCr');

% Display the three components
subplot(2,3,4), imshow(y1), title('Y');
subplot(2,3,5), imshow(cb1), title('Cb');
subplot(2,3,6), imshow(cr1), title('Cr');
saveas(fig_YCbCr1, "plots_exec1/YCbCr-1.pdf");

fig_YCbCr2 = figure;
fig_YCbCr2.Name = 'YCbCr - 2';
% Display the original image
subplot(2,3,2), imshow(im2_ycbcr), title('Flores Verdes YCbCr');

% Display the three components
subplot(2,3,4), imshow(y2), title('Y');
subplot(2,3,5), imshow(cb2), title('Cb');
subplot(2,3,6), imshow(cr2), title('Cr');
saveas(fig_YCbCr2, "plots_exec1/YCbCr-2.pdf");

fig_YCbCr3 = figure;
fig_YCbCr3.Name = 'YCbCr - 3';
% Display the original image
subplot(2,3,2), imshow(im3_ycbcr), title('teste RGB, YCbCr');

% Display the three components
subplot(2,3,4), imshow(y3), title('Y');
subplot(2,3,5), imshow(cb3), title('Cb');
subplot(2,3,6), imshow(cr3), title('Cr');
saveas(fig_YCbCr3, "plots_exec1/YCbCr-3.pdf");

%-----------------------exec1.3----------------------------%

%rgb2yuv('images\floresVermelhas.bmp');
%rgb2yuv('images\folhasVerdes.bmp');

