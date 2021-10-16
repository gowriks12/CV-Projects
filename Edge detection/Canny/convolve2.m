function [out] = convolve2(inp,kernel)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
out = zeros(size(inp));
K=size(kernel,1);
mid=round(K/2-1);
img_gray = double(inp);
for i=1:size(img_gray,1)-K-1
    for j=1:size(img_gray,2)-K-1
        out(i+mid,j+mid) = sum(sum(kernel.*img_gray(i:i+(K-1),j:j+(K-1))));
    end
end
end

