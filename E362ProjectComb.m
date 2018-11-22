% Combining evrithing into one code 
load ('filter.mat') % load filter 
load ('signalnoise.mat')% load signal with noise 

stefanox = stefanox.'; % take transpose to swich rowns and columns 
H_BPFFTnonoise = H_BPFFTwindowFT.*stefanox; % sice in frequency domain we can multiply instead of convolute

% Graph filtered signal 
figure;
plot(freq,abs(H_BPFFTnonoise))
xlabel('Frequency (Hz)');
title('Frequency Response of filtered signal')
ylabel ('Magnitude');



% play sound 
H_BPFTDnonoise= abs(ifft(H_BPFFTnonoise,N));
H_BPFTDnonoise2 =H_BPFTDnonoise.';


y=conv(H_BPFFTwindow,ynoise);

Y_fil=fft(y,N);

playObj = audioplayer(y,Fs,16);
play(playObj);

