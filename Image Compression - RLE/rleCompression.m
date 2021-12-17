clc; clear all; close all;
image = imread("golfcore.ppm");
figure();
imshow(image);title("Input image");
%% Histogram
hist = histo(image);
figure();
stem(hist);
%% Threshold
thresh = 170;
thresh_img =zeros(size(image));
for i=1:size(image,1)
    for j=1:size(image,2)
        if(image(i,j)> thresh)
            thresh_img(i,j) = 255;
        end
    end
end
figure();
imshow(thresh_img);title("Binary image");
%% Run Length Encoding
a=image'; a=a(:); a=a';
a=double(a);
rle(1)=a(1); m=2; rle(m)=1;
for i=1:length(a)-1
    if a(i)==a(i+1)
        rle(m)=rle(m)+1;
    else
        rle(m+1) = a(i+1);
        m=m+2; rle(m)=1;        %dynamic allocation and initialization of next element of rle
    end
end
disp(rle);
rle8 = uint8(rle);
figure();
imshow(rle8);
%% Run Length Decoding  
L=length(rle);
s=1;
k=1;
i=1;
while i<=L
    while s<=rle(i+1)
        rlev(k)=rle(i);
        s=s+1;
        k=k+1;
    end
    i=i+2;
    s=1;
end
out_image = reshape(rlev,[size(image,2),size(image,1)]);
out_image = out_image';
out8 = uint8(out_image);
figure();
imshow(out8);

