function [outMat] = normOwn(inMat)
f_bar = mean(inMat);
temp = (inMat - f_bar).^2;
deno = sqrt(sum(sum(temp)));
outMat = (inMat - f_bar)./deno;
end

