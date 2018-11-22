clear all
load ('myRecording3.mat')
% Re state parameter 
N = 80000;

% add noise 
noise= 0.5*randn(N,1);
ynoise = myRecording + noise; % addign noise to my tunning fork recording
fre = 1e3; % defining frequency 


xdft=fft(ynoise,N); % taking fft of my noise signal 
xdft=xdft(1:N/2+1); % definig the range (from lectures)
stefanox = (1/(Fs*N)) * abs(xdft).^2; 
stefanox(2:end-1) = 2*stefanox(2:end-1);
freq = 0:Fs/length(ynoise):Fs/2; % defining frequency 
yangle = angle (xdft(1:N/2+1)); 


figure(1);
plot(freq,abs(stefanox))
title('Magnitude of Signal With Noise ')
xlabel('Frequency (Hz)')
ylabel('Magnitude |x(f)|')

sound (ynoise);

y = bandpass(myRecording,fre)


save ('signalnoise.mat')

