function zedscript()
% Open the ZED
zed = webcam('ZED');
% Set video resolution
zed.Resolution = zed.AvailableResolutions{1};
% Get image size
[height width channels] = size(snapshot(zed));

% Create Figure and wait for keyboard interrupt to quit
f = figure('name','ZED camera','keypressfcn','close','windowstyle','modal');
ok = 1;
counter = 0;
% Start loop
      % Capture the current image
img = snapshot(zed);

% Split the side by side image image into two images
image_left = img(:, 1 : width/2, :);
image_right = img(:, width/2 +1: width, :);
imwrite(image_left, "circle_left" + string(counter) + ".jpg");
imwrite(image_right, "circle_right" + string(counter) + ".jpg");
% Display the left and right images
subplot(1,2,1);
imshow(image_left);
title('Image Left');
subplot(1,2,2);
imshow(image_right);
title('Image Right');
drawnow;
  % close the camera instance
clear zed
end