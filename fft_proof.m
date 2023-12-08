clear all;

dog_img = imread('miles_and_luther.JPG');
dog_img_gray = im2gray(imrotate(dog_img, -90));
figure;
imshow(dog_img_gray,"InitialMagnification","fit");

dft_dog_img = fft2(dog_img);
log_dft_dog_img = log(abs(dft_dog_img));
figure;
imshow(dft_dog_img,[-1 5],"InitialMagnification","fit");

figure;
imagesc(abs(fftshift(dft_dog_img)))