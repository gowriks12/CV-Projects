clc;
% taking input images
img_4=imread("P2_lake.png");
img_5=imread("P2_lena_gray_512.png");
img_6=imread("P2_peppers_gray.png");
img_7=imread("P2_walkbridge.png");

%figure(1);
%imshow(img_7); title("Color image");

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
%%
figure(1); 
subplot(2,2,1);
imshow(img_gray); title("Gray scale image");
%Adding noise

% Uniform noise
scale=50;
img_uni_noise= img_gray + cast(scale.*rand(size(img_gray)),'uint8');

subplot(2,2,2);
imshow(img_uni_noise); title("Image with uniform noise");

%Gaussian Noise
img_GS_noise = imnoise(img_gray,'gaussian');
subplot(2,2,3);
imshow(img_GS_noise); title("Image with Gaussian noise");

%Salt pepper noise
img_sp_noise = imnoise(img_gray,'salt & pepper');
subplot(2,2,4);
imshow(img_sp_noise); title("Image with salt and pepper noise");


%%
inp_img=img_gray;
cropped=nxnfilter(inp_img,7,1);

figure (2);
subplot(1,3,1);imshow(inp_img); title("Input image");
subplot(1,3,2);
imshow(cropped); title("Mean filtered image using 7X7 filter");


cropped1=nxnfilter(img_gray,7,2);
subplot(1,3,3);
imshow(cropped1); title(" Mean filtered image using seperable filters");

%% Histograms
% 7X7 filtered image
histogram=histo(cropped);

figure(3);
subplot(1,2,1);
stem(histogram); ("Histogram of 7X7 mean filtered image");
% Seperable filtered image
histogram1=histo(cropped1);

subplot(1,2,2);
stem(histogram1); ("Histogram of seperable mean filtered image");

out_hist=histogram-histogram1;
figure;
stem(out_hist);
%%
op1=nxnfilter(img_uni_noise,7,2);
op2=nxnfilter(img_GS_noise,7,2);
op3=nxnfilter(img_sp_noise,7,2);

figure(4);
subplot(2,2,1); imshow(cropped);title("Input gray filtered");
subplot(2,2,2);imshow(op1); title("Uniform noise image filtered");
subplot(2,2,3);imshow(op2); title("Gaussian noise image filtered");
subplot(2,2,4);imshow(op3); title("Salt & Pepper noise image filtered");