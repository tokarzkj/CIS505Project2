dog_img = imread('miles_and_luther.JPG');
dog_img_gray = im2gray(imrotate(dog_img, -90));
figure;
%imshow(dog_img_gray,"InitialMagnification","fit");

noisy_dog_img = imnoise(dog_img_gray, 'gaussian', 0, 0.025);
%imshow(noisy_dog_img,"InitialMagnification","fit")

%figure;
filtered_dog_img = wiener2(noisy_dog_img);
%imshow(filtered_dog_img, 'InitialMagnification', 'fit')

subplot(1, 3, 1), imshow(dog_img_gray,"InitialMagnification","fit")
subplot(1, 3, 2), imshow(noisy_dog_img,"InitialMagnification","fit")
subplot(1, 3, 3), imshow(filtered_dog_img,"InitialMagnification","fit")