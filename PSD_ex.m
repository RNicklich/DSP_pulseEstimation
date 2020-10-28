%setting the range to the number of frames per video.
N = numberOfFrames;
%setting our PSD input signal the meanRedLevels from the video.
x1 = meanRedLevels;
x1 = reshape((x1),[1,numberOfFrames]);

t = linspace(1,10,N);
dt = t(2) - t(1);
Fs = 1/dt;
%using MATLAB functions to compute the PSD.
h = spectrum.welch;
sx1 = psd(h,x1,'Fs',Fs);
%Plotting
figure
subplot(2,1,1), 
plot(t, x1);
ylabel('Original Signal')
subplot(2,1,2), plot(sx1);

