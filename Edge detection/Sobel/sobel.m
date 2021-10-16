clc;
% taking input images
img_1=imread("lake.png");
img_2=imread("lena_gray_512.png");
img_3=imread("peppers_gray.png");
img_4=imread("lady.png");

%% %% Colour to gray
img_rgb=img_4;
[row,col,d]=size(img_rgb);
if(d==3)
    img_gray=0.21*img_rgb(:,:,1)+0.72*img_rgb(:,:,2)+0.07*img_rgb(:,:,3);
else
   img_gray=img_rgb;
end
%% Mean filter and Sobel filter
mean_filter= [1 2 1;2 4 2;1 2 1]./16;
Gx = [1 0 -1;2 0 -2;1 0 -1];
Gy = [-1 -2 -1;0 0 0;1 2 1];

filt_img = convd2(img_gray,mean_filter);
x_img = convd2(filt_img,Gx);
y_img = convd2(filt_img,Gy);
out_img =(x_img.^2)+(y_img.^2);
out_img = (out_img).^(1/2);


filt_img=uint8(filt_img);
x_img=uint8(x_img);
y_img=uint8(y_img);
out_img=uint8(out_img);

figure(1);
subplot(2,2,1); imshow(img_gray); title("Input image");
subplot(2,2,2); imshow(filt_img); title("Mean filtered image");
subplot(2,2,3); imshow(x_img); title("After Gx convolving");
subplot(2,2,4); imshow(y_img); title("After Gy convolving");

figure(2);
imshow(out_img);

%%
