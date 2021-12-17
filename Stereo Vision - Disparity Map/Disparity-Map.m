clc; clear all; close all;

left = imread("renault1.pgm");
right = imread("renault2.pgm");
% left = imread("street1.pgm");
% right = imread("street2.pgm");
% left = imread("im2.png");
% right = imread("im6.png");
figure();
subplot(1,2,1);imshow(left); title("Left image");
subplot(1,2,2);imshow(right); title("Right image");
%% Disparity map using SSD
window = 21; %For street 5
disp_range = 40; %For street 20
tic;
SSD_Disp = ssd(right,left,window,disp_range);
toc;
%%
SSD_Disp = abs(SSD_Disp);
range = [0 45];
figure()
imshow(SSD_Disp,range);title("Using SSD, window = 21, range =40");
%% Disparity map using NCC
window = 21;
disp_range = 40;
tic;
NCC_Disp = ncc(left,right,window,disp_range);
toc;
%%
NCC_Disp = abs(NCC_Disp);
range = [0 45];
figure()
imshow(NCC_Disp,range);title("Using NCC, window = 21, range = 40");