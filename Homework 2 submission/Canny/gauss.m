function [gauss_matrix] = gauss(sigma)
%gauss Creats a gauss matrix using the sigma value
%   Sigma value is used to determine the kernel size of the gaussian filter
%   A gauss matrix is created using the gauss equation.
k=ceil(sigma)*5;
k = (k-1)/2;
[x,y] = meshgrid(-k:k,-k:k);
normal = 1/(2*pi*sigma^2);
a = exp(-(x.^2+y.^2)/2*sigma^2);

gauss_matrix = a.*normal;
end

