%% ECGR 4124 Project
% UNC Charlotte
% Spring 2020
% Dylan Languasco
% Jared Ne-Kindinga
% Rene Nicklich

%This file is meant to run in conjunction with ECGR4124_Project.m using the
%first video (face.mp4).
%In this code cross correlation is achieved with a number of different h[n]
%functions and plotting is used to visually inspect and estimae the heart
%rate of the individual in the provided video.
%% Filters Ranging from 1-2 Hz with increments of 0.1 Hz

%Sinusoidal h[n] signals with varying frequencies. Divided by 30 to account
%for 30 frames per second property of the video.
n = 0:100;
h0 = sin(((1*2*pi)/30)*n);
h1 = sin(((1.1*2*pi)/30)*n);
h2 = sin(((1.2*2*pi)/30)*n);
h3 = sin(((1.3*2*pi)/30)*n);
h4 = sin(((1.4*2*pi)/30)*n);
h5 = sin(((1.5*2*pi)/30)*n);
h6 = sin(((1.6*2*pi)/30)*n);
h7 = sin(((1.7*2*pi)/30)*n);
h8 = sin(((1.8*2*pi)/30)*n);
h9 = sin(((1.9*2*pi)/30)*n);
h10 = sin(((2*2*pi)/30)*n);

%plotting the h[n] Signals
figure

subplot(11,1,1),
stem(h0, 'b')
ylim([-inf, inf])
title('Impulse Response 1: 1 Hz')
xlabel('n')
ylabel('h0[n]')

subplot(11,1,2)
stem(h1, 'k')
ylim([-inf, inf])
title('Impulse Response 2: 1.1 Hz')
xlabel('n')
ylabel('h1[n]')

subplot(11,1,3)
stem(h2, 'b')
ylim([-inf, inf])
title('Impulse Response 3: 1.2 Hz')
xlabel('n')
ylabel('h2[n]')

subplot(11,1,4)
stem(h3, 'k')
ylim([-inf, inf])
title('Impulse Response 4: 1.3 Hz')
xlabel('n')
ylabel('h3[n]')

subplot(11,1,5)
stem(h4, 'b');
ylim([-inf, inf])
title('Impulse Response 5: 1.4 Hz');
xlabel('n')
ylabel('h4[n]')

subplot(11,1,6)
stem(h5, 'k');
ylim([-inf, inf])
title('Impulse Response 6: 1.5 Hz');
xlabel('n')
ylabel('h5[n]')

subplot(11,1,7),
stem(h6, 'b')
ylim([-inf, inf])
title('Impulse Response 7: 1.6 Hz')
xlabel('n')
ylabel('h6[n]')

subplot(11,1,8)
stem(h7, 'k')
ylim([-inf, inf])
title('Impulse Response 8: 1.7 Hz')
xlabel('blk')
ylabel('h7[n]')

subplot(11,1,9)
stem(h8, 'b')
ylim([-inf, inf])
title('Impulse Response 9: 1.8 Hz')
xlabel('n')
ylabel('h8[n]')

subplot(11,1,10)
stem(h9, 'k')
ylim([-inf, inf])
title('Impulse Response 10: 1.9 Hz')
xlabel('n')
ylabel('h9[n]')

subplot(11,1,11)
stem(h10, 'b');
ylim([-inf, inf])
title('Impulse Response 11: 2 Hz');
xlabel('n')
ylabel('h10[n]')

%% x[n]*h[-n]
%z= load('meanRedLevels');
redpixel = reshape((meanRedLevels),[1,301]); %reshaping vector so the convolution works correctly.

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
y8 = conv(x,flip(h8),'valid');
y9 = conv(x,flip(h9),'valid');
y10 = conv(x,flip(h10),'valid');

figure

subplot(11,1,1)
stem(y0, 'b')
ylim([-inf, inf])
title('Convolution Signal 1: 1 Hz')
xlabel('n')
ylabel('y0[n]')


subplot(11,1,2)
stem(y1, 'k')
ylim([-inf, inf])
title('Convolution Signal 2: 1.1 Hz')
xlabel('n')
ylabel('y1[n]')

subplot(11,1,3)
stem(y2, 'b')
ylim([-inf, inf])
title('Convolution Signal 3: 1.2 Hz')
xlabel('n')
ylabel('y2[n]')

subplot(11,1,4)
stem(y3, 'k')
ylim([-inf, inf])
title('Convolution Signal 4: 1.3 Hz')
xlabel('n')
ylabel('y3[n]')

subplot(11,1,5)
stem(y4, 'b')
ylim([-inf, inf])
title('Convolution Signal 5: 1.4 Hz');
xlabel('n')
ylabel('y4[n]')

subplot(11,1,6)
stem(y5, 'k')
ylim([-inf, inf])
title('Convolution Signal 6: 1.5 Hz');
xlabel('n')
ylabel('y5[n]')

subplot(11,1,7),
stem(y6, 'b')
ylim([-inf, inf])
title('Convolution Signal 7: 1.6 Hz')
xlabel('n')
ylabel('y6[n]')

subplot(11,1,8)
stem(y7, 'k')
ylim([-inf, inf])
title('Convolution Signal 8: 1.7 Hz')
xlabel('k')
ylabel('y7[n]')

subplot(11,1,9)
stem(y8, 'b')
ylim([-inf, inf])
title('Convolution Signal 9: 1.8 Hz')
xlabel('n')
ylabel('y8[n]')

subplot(11,1,10)
stem(y9, 'k')
ylim([-inf, inf])
title('Convolution Signal 10: 1.9 Hz')
xlabel('n')
ylabel('y9[n]')

subplot(11,1,11)
stem(y10, 'b');
ylim([-inf, inf])
title('Convolution Signal 11: 2 Hz');
xlabel('n')
ylabel('y10[n]')

%% y0 Has most stable signal at 1Hz, Finding more refined signal

n=1:100;

h0_new = sin(((1*2*pi)/30)*n);
h1_new = sin(((1.01*2*pi)/30)*n);
h2_new = sin(((1.02*2*pi)/30)*n);
h3_new = sin(((1.03*2*pi)/30)*n);
h4_new = sin(((1.04*2*pi)/30)*n);
h5_new = sin(((1.05*2*pi)/30)*n);
h6_new = sin(((0.9*2*pi)/30)*n);

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
title('Convolution Signal 1: 1 Hz')
xlabel('n')
ylabel('y0[n]')

subplot(7,1,2)
stem(y1_new, 'k')
ylim([-inf, inf])
title('Convolution Signal 2: 1.01 Hz')
xlabel('n')
ylabel('y1[n]')

subplot(7,1,3)
stem(y2_new, 'b')
ylim([-inf, inf])
title('Convolution Signal 3: 1.02 Hz')
xlabel('n')
ylabel('y2[n]')

subplot(7,1,4)
stem(y3_new, 'k')
ylim([-inf, inf])
title('Convolution Signal 4: 1.03 Hz')
xlabel('n')
ylabel('y3[n]')

subplot(7,1,5)
stem(y4_new, 'b');
ylim([-inf, inf])
title('Convolution Signal 5: 1.04 Hz');
xlabel('n')
ylabel('y4[n]')

subplot(7,1,6)
stem(y5_new, 'k');
ylim([-inf, inf])
title('Convolution Signal 6: 1.05 Hz');
xlabel('n')
ylabel('y5[n]')

subplot(7,1,7),
stem(y6_new, 'b')
ylim([-inf, inf])
title('Convolution Signal 7: 0.90 Hz')
xlabel('n')
ylabel('y6[n]')

%best choice filter was h4_new @ 1.04Hz

%% Plotting 1Hz correlated signal vs input
figure

subplot(2,1,1)
stem(y0, 'b');
ylim([-inf, inf])
title('Convolution Signal @ 1 Hz');
xlabel('n')
ylabel('y0[n]')

subplot(2,1,2)
stem(x, 'r')
ylim([-inf, inf])
xlim([0,250])
title('Original Signal')
xlabel('Frame')
ylabel('redPixelVal')
%% PLotting 1.04Hz correlated signal vs input. 
%this was the best fit curve that the team found and used for estimation of
%the persons heart rate in the video

figure

subplot(2,1,1)
stem(y4_new, 'b');
ylim([-inf, inf])
title('Convolution Signal @ 1.04 Hz');
xlabel('n')
ylabel('y4[n]')

subplot(2,1,2)
stem(x, 'r')
ylim([-inf, inf])
title('Original Signal')
xlim([0,250])
xlabel('Frame')
ylabel('redPixelVal')

