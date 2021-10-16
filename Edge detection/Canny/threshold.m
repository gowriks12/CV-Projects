function [res,strong,weak] = threshold(img,lowThreshRatio,highThreshRatio)
%threshold Using low and high threshold ratio it outputs image with strong
%and weak pixels only.
%   The function performs thresholding using two threshold and returns an
%   image with strong and weak pixels and sets all the pixels below low
%   threshold to 0.
highThresh= max(max(img)) * highThreshRatio;
% disp(highThresh);
lowThresh = highThresh * lowThreshRatio;
% disp(lowThresh);

[rows,cols]=size(img);
res=zeros(rows,cols);
weak =25;
strong = 255;

for i=1:rows
    for j=1:cols        
        if(img(i,j) >= highThresh)
            res(i,j)=strong;
        elseif(img(i,j) <lowThresh)
            res(i,j)=0;
        elseif(img(i,j)<=highThresh && img(i,j) >= lowThresh)
            res(i,j)=weak;
        end
    end
end
end

