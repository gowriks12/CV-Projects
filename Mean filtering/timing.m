clc;
% taking input images
tic
% img_4=imread("P2_lake.png");
% img_5=imread("P2_lena_gray_512.png");
% img_6=imread("P2_peppers_gray.png");
img_7=imread("P2_walkbridge.png");

figure(1);
imshow(img_7); title("Color image");

%% Colour to gray
img_rgb=img_7;
[row,col,d]=size(img_rgb);
if(d==3)
    red_img=img_rgb(:,:,1);
    green_img=img_rgb(:,:,2);
    blue_img=img_rgb(:,:,3);
    img_gray=0.21*red_img+0.72*green_img+0.07*blue_img;
else
   img_gray=img_rgb;
end

figure(2); 
imshow(img_gray); title("Gray scale image");
%%
inp_img=img_gray;
cropped=nxnfilter(inp_img,7,2);

figure (3);
imshow(cropped); title("Mean filtered image using 7X7 filter");
toc
%%
