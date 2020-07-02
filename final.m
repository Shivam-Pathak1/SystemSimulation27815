image_orig=imread('02.jpg') ; % read an image
image_noisy = imnoise(image_orig,'salt & pepper'); % add noise
figure(1) % create a figure
image(image_orig) % put read image on the figure
title('Original Image') % give a title to image
figure(2) % create second figure
image(image_noisy) % put noisy image on it
title('Image with Salt and Pepper Noise')  % give a title to the image

% Average filter
index = ones(3)/9 ; % convolution kernel 3X3 Matrix of 0.33 each
image_avg_filtered = imfilter(image_noisy,index) ; % Filter the noisy image trhough convolution kernel
figure(3) % Create a third figure
image(image_avg_filtered) % put the mean filtered image on it
title('Noisy image filtered by 3 X 3 mean filter') % give a title to the image
vec=0:1/255:1; colormap([vec' vec' vec']); % LUT for displaying in gray levels

% Median filter
image_med_filtered = image_noisy;
for col = 1 : 3 % Loop for all three layers in case of colored images, in case of BW, no loops needed
    image_med_filtered(:, :, col) = medfilt2(image_noisy(:, :, col), [3, 3]); % 3X3 Median Filtering
end
figure(4)  %create a fourth figure
image(image_med_filtered) %put the resultant image in fourth figure
title('Noisy Image filtered by a 3 X 3 median filter') % give it a title
vec=0:1/255:1; colormap([vec' vec' vec']); 