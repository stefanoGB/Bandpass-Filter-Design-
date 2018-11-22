clear all

load ('myRecording3.mat');

% H= fft (myRecording,N);
% fre=[0:1:N/2]*Fs/N; % Note that I have done this to plot both +ve (0 to fs/2)  side and -ve (-fs/2 to 0) side properly
% H = length(fre);
% 
% figure
% plot(fre,abs(H),'g');
% xlabel('Frequency (Hz)')
% ylabel('Magnitude response in dB')
% title('Frequency Response of Basic Sinc LPF')

N = 80000;
Stefxdft = fft(myRecording,N);
Stefxdft = Stefxdft(1:N/2+1);
stefanox = (1/(Fs*N)) * abs(Stefxdft).^2;
stefanox(2:end-1) = 2*stefanox(2:end-1);
freq = 0:Fs/length(myRecording):Fs/2;
yangle = angle (Stefxdft(1:N/2+1));

%plot Magnitude 
figure(1);
plot(freq,abs(stefanox))
title('Magnitude Spectrum Graph')
xlabel('Frequency (Hz)')
ylabel('magnitude ')

%plot PSD
figure(2);
plot(freq,10*log10(stefanox))
title('Power Spectrum FFT')
xlabel('Frequency (Hz)')
ylabel('Power dB')

%plot Phase 
figure(3);
plot(freq,yangle)
title('Phase Spectrum Graph FFT')
xlabel('Frequency (Hz)')
ylabel('Magnitude')

sound(myRecording)

% frequency 415.3



