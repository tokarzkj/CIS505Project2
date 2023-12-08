dog_img = imread('miles_and_luther.JPG');
dog_img_gray = im2gray(imrotate(dog_img, -90));

[M, N] = size(dog_img_gray);
fft_dog = fft2(dog_img_gray);
n = 1;

u = 0:(M-1);
idx = find(u > M/2);
u(idx) = u(idx)-M;

v = 0:(N-1);
idy = find(v > N/2);
v(idy) = v(idy)-N;

[V, U] = meshgrid(v, u);

D = sqrt(U.^2 + V.^2); 

%Higher cutoff distance
D0 = 50;
H_lower = 1./(1 + (D0./D).^(2*n));
G_lower = H_lower.*fft_dog;
recovered_dog_lower = real(ifft2(double(G_lower)));

%Higher cutoff distance
D0 = 300;
H_larger = 1./(1 + (D0./D).^(2*n));
G_larger = H_larger.*fft_dog;
recovered_dog = real(ifft2(double(G_larger)));

figure('name', 'Butterworth High-Pass');
subplot(1, 3, 1), imshow(dog_img_gray,"InitialMagnification","fit")
subplot(1, 3, 2), imshow(recovered_dog_lower, [])
subplot(1, 3, 3), imshow(recovered_dog, [])