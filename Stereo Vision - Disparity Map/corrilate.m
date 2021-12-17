function [out] = corrilate(temp,block)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
out = sum(sum(temp.*block));
end

