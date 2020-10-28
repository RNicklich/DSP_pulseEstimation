%% ECGR 4124 Project
% UNC Charlotte
% Spring 2020
% Dylan Languasco
% Jared Ne-Kindinga
% Rene Nicklich

%% Filters Ranging from 0.5-1.2 Hz with increments of 0.1 Hz

%Sinusoidal h[n] signals with varying frequencies. Divided by 30 to account
%for 30 frames per second property of the video.
n = 1:100;
h0 = sin(((.5*2*pi)/30)*n);
h1 = sin(((.6*2*pi)/30)*n);
h2 = sin(((.7*2*pi)/30)*n);
h3 = sin(((.8*2*pi)/30)*n);
h4 = sin(((.9*2*pi)/30)*n);
h5 = sin(((1*2*pi)/30)*n);
h6 = sin(((1.1*2*pi)/30)*n);
h7 = sin(((1.2*2*pi)/30)*n);

%Plotting h[n] Signals
figure

subplot(8,1,1),
stem(h0, 'b')
title('Impulse Response 1: 0.5 Hz')
xlabel('n')
ylabel('h0[n]')

subplot(8,1,2)
stem(h1, 'k')
title('Impulse Response 2: 0.6 Hz')
xlabel('n')
ylabel('h1[n]')

subplot(8,1,3)
stem(h2, 'b')
title('Impulse Response 3: 0.7 Hz')
xlabel('n')
ylabel('h2[n]')

subplot(8,1,4)
stem(h3, 'k')
title('Impulse Response 4: 0.8 Hz')
xlabel('n')
ylabel('h3[n]')

subplot(8,1,5)
stem(h4, 'b');
title('Impulse Response 5: 0.9 Hz');
xlabel('n')
ylabel('h4[n]')

subplot(8,1,6)
stem(h5, 'k');
title('Impulse Response 6: 1 Hz');
xlabel('n')
ylabel('h5[n]')

subplot(8,1,7),
stem(h6, 'b')
title('Impulse Response 7: 1.1 Hz')
xlabel('n')
ylabel('h6[n]')

subplot(8,1,8)
stem(h7, 'k')
title('Impulse Response 8: 1.2 Hz')
xlabel('n')
ylabel('h7[n]')


%% x[n]*h[-n] - Cross Correlation and plotting of results
%z= load('meanRedLevels');
redpixel = reshape((meanRedLevels),[1,311]); %reshaping vector so the convolution works correctly.

x = redpixel;

n =0:100;
y0 = conv(x,flip(h0),'valid');
y1 = conv(x,flip(h1),'valid');
y2 = conv(x,flip(h2),'valid');
y3 = conv(x,flip(h3),'valid');
y4 = conv(x,flip(h4),'valid');
y5 = conv(x,flip(h5),'valid');
y6 = conv(x,flip(h6),'valid');
y7 = conv(x,flip(h7),'valid');

figure

subplot(8,1,1),
stem(y0, 'b')
title('Convolution Signal 1: 0.5 Hz')
xlabel('n')
ylabel('y0[n]')
ylim([-inf, inf])

subplot(8,1,2)
stem(y1, 'k')
title('Convolution Signal 2: 0.6 Hz')
xlabel('n')
ylabel('y1[n]')
ylim([-inf, inf])

subplot(8,1,3)
stem(y2, 'b')
title('Convolution Signal 3: 0.7 Hz')
xlabel('n')
ylabel('y2[n]')
ylim([-inf, inf])

subplot(8,1,4)
stem(y3, 'k')
title('Convolution Signal 4: 0.8 Hz')
xlabel('n')
ylabel('y3[n]')
ylim([-inf, inf])

subplot(8,1,5)
stem(y4, 'b');
title('Convolution Signal 5: 0.9 Hz');
xlabel('n')
ylabel('y4[n]')
ylim([-inf, inf])

subplot(8,1,6)
stem(y5, 'k');
title('Convolution Signal 6: 1 Hz');
xlabel('n')
ylabel('y5[n]')
ylim([-inf, inf])

subplot(8,1,7),
stem(y6, 'b')
title('Convolution Signal 7: 1.1 Hz')
xlabel('n')
ylabel('y6[n]')
ylim([-inf, inf])

subplot(8,1,8)
stem(y7, 'k')
title('Convolution Signal 8: 1.2 Hz')
xlabel('k')
ylabel('y7[n]')
ylim([-inf, inf])


%% y5 Has most like signal at 1Hz, Finding more refined signal

n=1:100;

h0_new = sin(((0.9*2*pi)/30)*n);
h1_new = sin(((0.92*2*pi)/30)*n);
h2_new = sin(((0.94*2*pi)/30)*n);
h3_new = sin(((0.96*2*pi)/30)*n);
h4_new = sin(((0.98*2*pi)/30)*n);
h5_new = sin(((1*2*pi)/30)*n);
h6_new = sin(((0.97*2*pi)/30)*n); %Expected best fit given known hear rate


y0_new = conv(x,flip(h0_new),'valid');
y1_new = conv(x,flip(h1_new),'valid');
y2_new = conv(x,flip(h2_new),'valid');
y3_new = conv(x,flip(h3_new),'valid');
y4_new = conv(x,flip(h4_new),'valid');
y5_new = conv(x,flip(h5_new),'valid');
y6_new = conv(x,flip(h6_new),'valid');



figure

subplot(7,1,1),
stem(y0_new, 'b')
ylim([-inf, inf])
title('Convolution Signal 1: 0.9 Hz')
xlabel('n')
ylabel('y0new[n]')
ylim([-inf, inf])

subplot(7,1,2)
stem(y1_new, 'k')
ylim([-inf, inf])
title('Convolution Signal 2: 0.92 Hz')
xlabel('n')
ylabel('y1new[n]')
ylim([-inf, inf])

subplot(7,1,3)
stem(y2_new, 'b')
ylim([-inf, inf])
title('Convolution Signal 3: 0.94 Hz')
xlabel('n')
ylabel('y2new[n]')
ylim([-inf, inf])

subplot(7,1,4)
stem(y3_new, 'k')
ylim([-inf, inf])
title('Convolution Signal 4: 0.96 Hz')
xlabel('n')
ylabel('y3new[n]')
ylim([-inf, inf])

subplot(7,1,5)
stem(y4_new, 'b');
ylim([-inf, inf])
title('Convolution Signal 5: 0.98 Hz');
xlabel('n')
ylabel('y4new[n]')
ylim([-inf, inf])

subplot(7,1,6)
stem(y5_new, 'k');
ylim([-inf, inf])
title('Convolution Signal 6: 1 Hz');
xlabel('n')
ylabel('y5new[n]')
ylim([-inf, inf])

subplot(7,1,7)
stem(y6_new, 'k');
ylim([-inf, inf])
title('Convolution Signal 6: 0.97 Hz');
xlabel('n')
ylabel('y6new[n]')
ylim([-inf, inf])

%% Plotting 0.96Hz cross correlated signal vs input

figure

subplot(2,1,1)
stem(y3_new, 'b');
ylim([-inf, inf])
title('Convolution Signal 5: .96 Hz');
xlabel('n')
ylabel('y3new[n]')

subplot(2,1,2)
stem(x, 'r')
ylim([-inf, inf])
title('Original Signal')
xlim([0,250])
xlabel('Frame')
ylabel('redPixelVal')

%% Plotting 0.98Hz cross correlated signal vs input

figure

subplot(2,1,1)
stem(y4_new, 'b');
ylim([-inf, inf])
title('Convolution Signal 5: .98 Hz');
xlabel('n')
ylabel('y4[n]')

subplot(2,1,2)
stem(x, 'r')
ylim([-inf, inf])
title('Original Signal')
xlim([0,250])
xlabel('Frame')
ylabel('redPixelVal')

%% Plotting 1Hz cross correlated signal vs input

figure

subplot(2,1,1)
stem(y5_new, 'b');
ylim([-inf, inf])
title('Convolution Signal 5: 1 Hz');
xlabel('n')
ylabel('y4[n]')

subplot(2,1,2)
stem(x, 'r')
ylim([-inf, inf])
title('Original Signal')
xlim([0,250])
xlabel('Frame')
ylabel('redPixelVal')

%% Plotting 0.96Hz cross correlated signal vs input
% This turned out to be the best fit that the team could find, confirming
% their hypothesis.
figure

subplot(2,1,1)
stem(y6_new, 'b');
ylim([-inf, inf])
title('Convolution Signal 5: .97 Hz');
xlabel('n')
ylabel('y4[n]')

subplot(2,1,2)
stem(x, 'r')
ylim([-inf, inf])
title('Original Signal')
xlim([0,250])
xlabel('Frame')
ylabel('redPixelVal')

