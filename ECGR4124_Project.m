%% ECGR 4124 Project
% UNC Charlotte
% Spring 2020
% Dylan Languasco
% Jared Ne-Kindinga
% Rene Nicklich
%
% In this project, Videos can be analyzed for their average red pixel values
% and using cross correlation, an estimate of a persons hear rate can be made.
% To do so, visual inspection will have to be performed on the cross correlation signals.
% Separate plots may also be needed to facilitate the comparison of signals.
%
% This project was completed by the above named students for the Digital Signal Processing Class
% (ECGR 4124/5124) at the University of North Carolina at Charlotte.
%% Reading Mean Red Values from a Video File

clc;    % Clear the command window.
close all;
imtool close all;
clear;  % Erase all existing variables.
workspace;
fontSize = 22;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-->! ! ! ! ! ! ! ! ! ! ! ! !  IMPORTANT ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! !<--
% Change this to approriate file path
%Run one file at a time.
%Heartbeat_impulse.m will correspond to face.mp4 video
%Heartbeat_impulse_vid2.m will correspond to DylanVid.mp4
%The appropriate Heartbeat_impulse file will have to be run to avoid
%errors.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Example file path if video not in same folder:
% --> 'C:\Users\Rene\MATLAB\Projects\ECGR 4124 - Project\face.mp4' 
%fileName = 'face.mp4'
fileName = 'DylanVid.mp4'


%Reading video file into a variable
v = VideoReader(fileName);
% Determine number of Frames in the Video.
numberOfFrames = v.NumFrames;

%Determining video properties for appropriate array sizes.
v_h = v.Height;
v_w = v.Width;

numberOfFramesWritten = 0; %Keeps track of analyzed frames for display purposes.

meanRedLevels = zeros(numberOfFrames, 1); %initializing array of zeros to preserve processing power.

%For loop that runs from 1 to the number of frames, storing red hue values
%for pixels in meaRedLevels array.
for frame = 1 : numberOfFrames
    % Extract the frame from the video.
    thisFrame = read(v, frame);
    
    % Display the current frame.
    hImage = subplot(1, 2, 1);
    image(thisFrame);
    caption = sprintf('Frame %4d of %d.', frame, numberOfFrames);
    title(caption, 'FontSize', fontSize);
    drawnow; % Force it to refresh the window.
    
    % Calculate the mean red levels using mean^2.
    meanRedLevels(frame) = mean(mean(thisFrame(:, :, 1)));
    
    % Plotting the mean red levels.
    hPlot = subplot(1, 2, 2);
    hold off;
    plot(meanRedLevels, 'r-', 'LineWidth', 1);
    grid on;
    
    % labeling the graphs after analysis is complete
    if frame == numberOfFrames
        xlabel('Frame Number');
        ylabel('Red Level');
    end
    
    % Update user with the progress.  Display in the command window.
    progressIndication = sprintf('Processed frame %4d of %d.', frame, numberOfFrames);
    disp(progressIndication);
    % Increment frame count (should eventually = numberOfFrames
    % unless an error happens).
    numberOfFramesWritten = numberOfFramesWritten + 1;
    
    
end

% Alert user that we're done.

finishedMessage = sprintf('Done!  It processed %d frames of\n"%s"', numberOfFramesWritten, fileName);

disp(finishedMessage); % Write to command window.

