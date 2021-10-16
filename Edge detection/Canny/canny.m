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
%% Gaussian filtering
sigma = 1.4;
gauss_matrix = gauss(sigma);
figure, surf(gauss_matrix); title("Gauss filter with sigma =1.4");

img_gray = padarray(img_gray,[1,1],0,'both');
img_gray = double(img_gray);
%%
filt_img = convolve2(img_gray,gauss_matrix);
filt_img=uint8(filt_img);

%% Sobel filtering
Gx = [1 0 -1;2 0 -2;1 0 -1];
Gy = [-1 -2 -1;0 0 0;1 2 1];
x_img = convolve2(filt_img,Gx);
y_img = convolve2(filt_img,Gy);

mag_img =(x_img.^2)+(y_img.^2);
mag_img = (mag_img).^(1/2);
mag_img = mag_img./255;
theta = atan2d(y_img,x_img);

filt_img=uint8(filt_img);
umag_img=uint8(mag_img);
%% Converting all angles to positive angles
for i=1:size(theta,1)
    for j=1:size(theta,2)
        if(theta(i,j)<0)
            theta(i,j) = theta(i,j)+180;
        end
    end
end
%% Non max supression
nms_img = non_max(mag_img,theta);

%% Threshold
[thresh_img,strong,weak] = threshold(nms_img,0.03,0.09);
thresh1_img=uint8(thresh_img);
figure, imshow(thresh1_img); title("Double thresholded image");
%% Hysterisis
out_img = hysteresis(thresh_img,weak,strong);
out_img = out_img(3:size(out_img,1)-2,3:size(out_img,2)-2);
figure, imshow(out_img);title("Final edge detected image");
%% Plotting
img_gray = uint8(img_gray);
figure,
subplot(2,2,1); imshow(img_gray); title("Input image");
subplot(2,2,2); imshow(filt_img); title("Mean filtered image");
subplot(2,2,3); imshow(mag_img); title("After Sobel filtering");
subplot(2,2,4); imshow(nms_img); title("Non- max suppressed image");

figure,title("Canny Edge detection result");
subplot(1,2,1); imshow(img_gray); title("Input image");
subplot(1,2,2); imshow(out_img); title("Final edge detected image");