clear;

%sig1Ϊ������ʽ��sig2Ϊָ����ʽ
t = 0:.01:4*pi;
f=0;
sig1 = sin(f*t);
for f=1:1:20 %Ƶ��
    sig1 = sig1+sin(f*t);
end
subplot(221);
plot(t,sig1);  
f2=0;
sig2 = exp(f2*t);
for f2=1:0.1:20
    sig2 = sig2+exp(f2*t);
end
subplot(222);
plot(t,sig2);

img = imread('test1.jpg');
img = rgb2gray(img);
subplot(223);
imshow(img);
title('ԭʼͼ��');
spec = fftshift(fft2(img));
spec(abs(spec)<5000)=0;  %�˲�
img2 = ifft2(ifftshift(spec));  %��任
subplot(224);
imshow(img2,[0 255]);
title('�任���ͼ��');
