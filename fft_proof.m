clear all;

dog_img = im2gray(imread('miles_and_luther.JPG'));
dog_img = imrotate(dog_img, -90);
figure;
imshow(dog_img,"InitialMagnification","fit");

dft_dog_img = fft2(dog_img);
log_dft_dog_img = log(abs(dft_dog_img));
figure;
imshow(dft_dog_img,[-1 5],"InitialMagnification","fit");

figure;
noisy_dog_img = imnoise(dog_img, 'gaussian', 0, 0.025);
imshow(noisy_dog_img,"InitialMagnification","fit")

figure;
filtered_dog_img = wiener2(noisy_dog_img);
imshow(filtered_dog_img, 'InitialMagnification', 'fit')