function [out_img] = convd2(inp_img,kernel)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
k=length(kernel);

mid=round(k/2); %Computing mid point of filter matrix
K=(k-1)/2; %Computing iterating range for convolution
inp_img=double(inp_img); %Converting the image to double
[rows,cols]=size(inp_img);
out_img=zeros(rows,cols);
for i=mid:rows-K
    for j=mid:cols-K
        sum=0;
        for u=-K:K             
            for v=-K:K                
                sum=sum+inp_img(i+u,j+v)*kernel((u+mid),(v+mid));         
            end %Multiply and accumulate
        end
        out_img(i,j)=sum;   %Update the output image     
    end
end

%out_i=uint8(out_img); %Convert double to uint8
%out_img=out_i(mid:rows-K,mid:cols-K); %Cropping the padded image
end

