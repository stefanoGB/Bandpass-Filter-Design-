%%%%%%%%PROBLEM 4%%%%%%%%%%%%
% Obtain sound device informations
devinfo = audiodevinfo;

%%%%%%%%%%%%%%%%%%%%%%%%
devinfo.input  %% give me the input details
devinfo.input(1) % gives the first input device in my laptop
%devinfo.input(2) % gives the second input device in my laptop
devinfo.output % the output details
devinfo.output(1) % gives the first output device in my laptop
%devinfo.output(2)  % gives the second output device in my laptop
%%%%%%%%%%%%%%%%%%%%%%%

% set the input and output device we will use in the code
inputdev = devinfo.input(1).ID; % only the ID
outputdev = devinfo.output(1).ID; % only the ID

% Set the sample rate, bit depth and channels for the recording
Fs = 8000;
Nbits = 16;
NChannels = 1;

% create the recorder obejct. We will use this object to record our sound
% and also store it into this object
recObj = audiorecorder(Fs,Nbits,NChannels,inputdev);

% if the recording does not work, use the following line to load an audio file
% % Filename = 'test.wav';
% % [myRecording, Fs, Nbits] = wavread(Filename);

recordTime = 10;
disp('Start Recording');
recordblocking(recObj, recordTime);
disp('Finish Recording');

% grabs the audio data from our recorded sound and stores it into a
% variable
myRecording = getaudiodata(recObj);

figure;
plot([1:length(myRecording)]/Fs,myRecording);
xlabel('time (s)')
ylabel('Amplitude')

% If we want to play the audio again, we create another object and then call
% the audioplayer function to play our sound
playObj = audioplayer(myRecording,Fs,Nbits,outputdev);
play(playObj);

% This will store our current workspace (e.g. all variables) so we can work
% on it later
Stefanox = fft(myRecording)
save('myRecording.mat')
plot (abs(Stefanox))

% frequency 415.3



