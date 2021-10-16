function [Edges] = zero_cross(LoG_img,slope)
%zero_cross Input: LoG filtered image, slope; Output: Detected edges
%   This function inputs the LoG filtered image and the slope of the image
%   and traverses throughout the image and finds all the zero crossings
%   that are greater than the slope and returns the edges.
[rows,cols]=size(LoG_img);
Edges = zeros(rows,cols);
for i=2:rows-1
    for j=2:cols
        if(LoG_img(i,j)>0)
            if(LoG_img(i,j+1)>=0 && LoG_img(i,j-1)<0 || (LoG_img(i,j+1)<0 && LoG_img(i,j-1)>=0) && abs(LoG_img(i,j+1)-LoG_img(i,j-1))> slope)
                Edges(i,j)=LoG_img(i,j+1);
            elseif (LoG_img(i+1,j)>=0 && LoG_img(i-1,j)<0) || (LoG_img(i+1,j)<0 && LoG_img(i-1,j)>=0 && abs(LoG_img(i+1,j)- LoG_img(i-1,j))>slope)
                Edges(i,j)=LoG_img(i,j+1);
            elseif (LoG_img(i+1,j+1)>=0 && LoG_img(i-1,j-1))<0 || (LoG_img(i+1,j+1)<0 && LoG_img(i-1,j-1)>=0 && abs(LoG_img(i+1,j+1)- LoG_img(i-1,j-1))>slope)
                Edges(i,j)=LoG_img(i,j+1);
            elseif (LoG_img(i-1,j+1)>=0 && LoG_img(i+1,j-1))<0 || (LoG_img(i-1,j+1)<0 && LoG_img(i+1,j-1)>=0 && abs(LoG_img(i+1,j-1)- LoG_img(i-1,j-1))>slope)
                Edges(i,j)=LoG_img(i,j+1);
            end
        end
    end
end         
end

