function [histogram] = histo(img_gray)
%HISTO Computes the histogram
%   Input to this function is a gray scale image whose histogram has to be
%   computed. Output is a [1,256] sized double which holds the histogram of
%   the image.
img_gray=double(img_gray); %Convert image to double for easier processing
histogram=zeros(1,256); %Initialize output double
[rows,cols]=size(img_gray); %Initialize
for x=1:rows
    for y=1:cols
        value=img_gray(x,y); %Extract the value of the pixel
        if (value==0)
            value=value+1; %If pixel value is 0, increment it to 1 
        end
        histogram(value)= histogram(value)+1; %Increment count of the pixel
    end
end

end

