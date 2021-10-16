function [nms_img] = non_max(mag_img,theta)
%non_max : Non maximum suppression suppresses the non-edges based on the
%angles
%   This function takes input of magnitude image and angles and provides
%   non-maximum supressed image.
[rows,cols]=size(mag_img);
nms_img = zeros(rows,cols);

for i=2:rows-1
    for j=2:cols-1
        q=255;
        r=255;        
        %angle 0
        if(0 <= theta(i,j) <22.5) || (157.5 <= theta(i,j) <= 180)
            q = mag_img(i,j+1);
            r = mag_img(i,j-1);
        %angle 45
        elseif(22.5<=theta(i,j)< 67.5)
            q=mag_img(i-1,j-1);
            r=mag_img(i+1,j+1);
        % angle 90
        elseif (67.5 <=theta(i,j) <112.5)
            q = mag_img(i+1,j);
            r = mag_img(i-1,j);
        %angle 135
        elseif (112.5 <= theta(i,j) <157.5)
            q = mag_img(i+1,j-1);
            r = mag_img(i-1,j+1);
        end
        
        if(mag_img(i,j) >= q) && (mag_img(i,j) >=r)
            nms_img(i,j) = mag_img(i,j);
        else
            nms_img(i,j) = 0;
        end
    end
end          

end