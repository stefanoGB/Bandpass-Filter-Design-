clear all
load ('myRecording3.mat')

% parameters  
L=500;    
M=L/1.025; 
Z=2*M+1;
n=0:1:Z-1;
Fc=410;
Fs=8000;
Fh = 420;
freq = 0:Fs/length(myRecording):Fs/2;
N = 80000;

% equations for Hamming Window Kaiser is better but Hamming is easier 
H_HLF = 2*Fc/Fs*sinc(2*Fc/Fs*(n-M));

H_HPF = 2*Fh/Fs*sinc(2*Fh/Fs*(n-M));


H_BPF = H_HLF - H_HPF; % substract each fileter 


H_BPFFTwindowFT = fft(H_BPF,N); % fast fourier transform of Band pass filter 
H_BPFFTwindowFT = H_BPFFTwindowFT(1:N/2+1); % define range 
stefanox = (1/(Fs*N)) * abs(H_BPFFTwindowFT).^2; % only take positive values 
stefanox(2:end-1) = 2*stefanox(2:end-1);

% plot fft of filter 
figure;
plot(freq,(abs((H_BPFFTwindowFT))));
xlabel('Frequency (Hz)');
title('Filter')



w=0.54-0.46*cos(2*pi*n/(Z-1));  %Hamming window filter equation

H_BPFFTwindow= H_BPF .*w; % multiply BPF by Hamming window 
H_BPFFTwindowFT = fft (H_BPFFTwindow,N);% take fft of hamming window filter 
H_BPFFTwindowFT = H_BPFFTwindowFT(1:N/2+1); % define range 
stefanox = (1/(Fs*N)) * abs(H_BPFFTwindowFT).^2;
stefanox(2:end-1) = 2*stefanox(2:end-1);


% plot hamming windowed filter 
figure;
plot(freq,(abs(H_BPFFTwindowFT)));
xlabel('Frequency (Hz)');
title('Hamming Windowed Filter')

%save filter as a filter.mat
save ('filter.mat')




