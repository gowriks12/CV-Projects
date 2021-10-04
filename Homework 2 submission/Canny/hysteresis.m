function [out_img] = hysteresis(img,weak,strong)
%hysteresis : Performs histeresis on the image considering the weak and
%strong pixel levels
%   This function iterates through the image and finds if the weak pixels
%   are connected to the strong pixels.
[rows,cols]=size(img);
out_img=img;
for i=2:rows-1
    for j=2:cols-1
        if(img(i,j) == weak)
            if((img(i+1,j-1) == strong) || (img(i+1,j) == strong) || (img(i+1,j+1)==strong) || (img(i,j-1)==strong) || (img(i,j+1) == strong) || (img(i-1,j-1)==strong) || (img(i-1,j)==strong) || (img(i-1,j+1)==strong))
                out_img(i,j)= strong;
            else
                out_img(i,j)=0;
            end
        end
    end
end
end
