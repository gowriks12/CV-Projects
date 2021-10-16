clc;
%Taking input
img_1=imread("P1_lena_gray_512.png");
img_2=imread("P1_Unequalized_Hawkes_Bay_NZ.jpg");
img_3=imread("P1_university.png");

%% 
img_rgb=img_3;
figure(1);
imshow(img_rgb);

%Converting rgb to gray if necessary
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
[rows,cols]=size(img_gray);
% Histogram equalization
% Step 1: Histogram 
%
histogram=histo(img_gray);
% step 2
% %% Histogram equalization
[img_gray_out,out_hist]=hist_equalize(img_gray,histogram);

figure(2);
subplot(1,2,1);
imshow(img_gray); title("Input gray image");
subplot(1,2,2);
imshow(img_gray_out);title("Equalized image");

figure(3);
subplot(1,2,1);
stem(histogram);title("Input histogram");
subplot(1,2,2);
stem(out_hist);title("Equalized histogram");
