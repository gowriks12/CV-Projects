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
%% Marr-Hildreth filter
% LoG filter definition 
sigma=2;
log_filt=LoG(sigma);
%disp(log_filt);
figure(4);
surf(log_filt);title("LoG filter for sigma = 2");
%% Convolving 
LoG_img = zeros(size(img_gray));
K=size(log_filt,1);
mid=round(K/2-1);
img_gray = double(img_gray);
for i=1:size(img_gray,1)-K-1
    for j=1:size(img_gray,2)-K-1
        LoG_img(i+mid,j+mid) = sum(sum(log_filt.*img_gray(i:i+(K-1),j:j+(K-1))));
    end
end
figure, imshow(LoG_img); title("LoG filtered image");
%% Slope 
slope = 0.5*mean(abs(LoG_img(:)));
%% Zero cross
detectedEdges = zero_cross(LoG_img,slope);
img_gray = uint8(img_gray);
figure, 
subplot(1,2,1); imshow(img_gray); title("Input image");
subplot(1,2,2);imshow(detectedEdges); title("Edge detected imges");