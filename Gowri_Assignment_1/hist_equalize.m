function [eq_img,out_hist] = hist_equalize(img_gray,histogram)
%HIST_EQUALIZE This function performs histogram equalization of image
%   Input to this function is the image that has to be equalized. The image
%   histogram is equalized and output image along with the equalized
%   histogram is provided as output.
hist_sum=zeros(1,256); %Initialize histogram sum variable
[rows,cols]=size(img_gray);
val=0; %Initialize value to 0
for i=1:256
    hist_sum(i)=histogram(i)+val; %Compute histogram sum
    val=hist_sum(i); %Update val variable
end
norm_sum=zeros(1,256); %Initialize another vector to store normalized sum
for i=1:256
    norm_sum(i)=round(hist_sum(i)*(1/(rows*cols))*255); %Compute norm_sum
end
eq_img=img_gray; %Initialize output image to input image

for x=1:rows
    for y=1:cols
        value=img_gray(x,y);
        if(value==0)
            value=value+1;
        end
        change=norm_sum(value);   
        eq_img(x,y)= change; %Updating output image with updated values
    end
end
out_hist=histo(eq_img); %Compute histogram of output equalized image
end

