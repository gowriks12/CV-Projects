function [nLoG] = LoG(sigma)
%LoG This function takes input of sigma value and creates a normalized Laplacian of
%Gaussian filter 
%   Sigma value is used to determine the kernel size and for that kernel,
%   LoG filter equation is implemented. Normalization of this LoG filter is
%   done and provided as output.
k=ceil(sigma)*5;
k = (k-1)/2; %Determining kernel size
[x,y] = meshgrid(-k:k,-k:k); %Initializing kernel

a = (x.^2+y.^2-2*sigma^2)/sigma^4;
b = exp(-( x.^2 + y.^2 )/(2*sigma^2));
b= b/sum(b(:));

LoG=a.*b; %LoG filter 
nLoG=LoG-mean2(LoG); %Normalized LoG filter
end

