function [point, color_is_dark] = detect()
load('zedstereoParams.mat');
% 
I1 = imread('circle_left0.jpg');
I2 = imread('circle_right0.jpg');
I1 = undistortImage(I1,zedstereoParams.CameraParameters1);
I2 = undistortImage(I2,zedstereoParams.CameraParameters2);

% for left
[centers, radii, metric] = imfindcircles(rgb2gray(I1), [10, 1000], "ObjectPolarity", "dark", "Sensitivity", 0.8);
[~, argmax] = max(metric);
center1 = centers(argmax, :);

% for right
[centers2, radii2, metric2] = imfindcircles(rgb2gray(I2), [10, 1000], "ObjectPolarity", "dark", "Sensitivity", 0.8);
[~, argmax] = max(metric2);
center2 = centers2(argmax, :);

% triangulate the location of the center
point1 = triangulate(center1, center2, zedstereoParams);
pix = impixel(I1, center1(1), center1(2)); % sample from the center of the dot
point = [point1(1) -1 * point1(2)-70 point1(3)+100]/1000; % add offsets specific to mechanical position of camera wrt origin
if (mean(pix) < 35) % if the object is dark set color_is_dark
    color_is_dark = 1;
else
    color_is_dark = 0;
end
end