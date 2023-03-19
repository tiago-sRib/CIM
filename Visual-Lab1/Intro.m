clc

im = imread("images\praia.bmp");
[line,col]=size(im(:,:,1));

imshow(im);
im2 = double(im);

im2 = im2+10;
im2 = uint8(im2);
imwrite(im2, 'name.bmp');
imwrite(im2, 'name2.jpeg');

im = imread("images\praia.bmp");
size(im)
r = im(:,:,1);
b = im(:,:,2);
g = im(:,:,3);
[lin, col, plane] = size(im);

im2 = uint8(zeros(lin, col, plane));
im2(:, :, 1) = r+50;
im2(:, :, 2) = g-50;
im2(:, :, 3) = b+100;
figure; 
imshow(im);
figure; 
imshow(im2);
