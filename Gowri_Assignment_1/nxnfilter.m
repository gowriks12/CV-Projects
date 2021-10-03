function [out_img] = nxnfilter(inp_img,k,type)
%NXNFILTER This function mean filters the image
%   The function takes in three inputs, image that has to be filtered and
%   the size of the filter that has to be used. Type input determines if
%   the function will filter using NXN filter or a combination of 1XN and
%   NX1. Output of the function is the output image which is mean filtered.

mid=round(k/2); %Computing mid point of filter matrix
K=(k-1)/2; %Computing iterating range for convolution
%Padding image
[rows,cols]=size(inp_img); 
padded=[zeros(rows,3),inp_img,zeros(rows,3)]; 
padded=[zeros(3,cols+(K*2)); padded;zeros(3,cols+(K*2))];
padded_img=double(padded); %Converting the image to double
[rows,cols]=size(padded_img);
out_img=zeros(rows,cols);
% When convolution has to be using NXN filter
if(type==1)    
    kernel=ones(k)./k^2; %Compute the kernel
    kernel=flip(kernel,2);
    kernel= flip(kernel,1);  

    for i=mid:rows-K
        for j=mid:cols-K
            sum=0; 
            for u=-K:K             
                for v=-K:K                
                    sum=sum+padded_img(i+u,j+v)*kernel((u+mid),(v+mid));         
                end %Multiply and accumulate
            end
            out_img(i,j)=sum;   %Update the output image     
        end
    end
    out_i=uint8(out_img); %Convert double to uint8
    out_img=out_i(mid:rows-K,mid:cols-K); %Cropping the padded image
end
% For seperable filter of 1XN and NX1
if(type==2)
    fc=ones(1,k)./k; %Computing column filter
    fr=ones(k,1)./k; %Computing row filter

    out1=zeros(rows,cols);
    out2=zeros(rows,cols);
    
    %Processing rows
    for r=1:rows
        for c=mid:cols-K
            sum=0;
            for dc=-K:K
                sum=sum+padded_img(r,c+dc)*fc(dc+mid);
            end
            out1(r,c)=sum; %Image after row processing
        end
    end
    %Processing columns
    for r=mid:rows-K
        for c=1:cols
            sum=0;
            for dr=-K:K
                sum=sum+out1(r+dr,c)*fr(dr+mid);
            end
            out2(r,c)=sum; %Image after columns processing
        end
    end

    out_img=uint8(out2);
    out_img=out_img(mid:rows-K,mid:cols-K); %Cropping the padded part of the image
end

