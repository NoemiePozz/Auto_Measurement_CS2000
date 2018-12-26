% autoMeasurements is a function which automates the display of a color
% and the measures of colorimetric data by a CS-2000 spectroradiometer.
% It only works with uniform colors.
% Some functions to communicate with the spectroradiometer are needed and
% available at this address: https://github.com/fglichttechnik/KonicaMinolta-CS2000-MATLAB
%
% Below is a list of the files that are needed in the same repository
% as the function autoMeasurements:
% CS2000_errMessage.m
% CS2000_initConnection.m
% CS2000_measure.m
% CS2000_readMeasurement.m
% CS2000Measurement.m

function autoMeasurements ( RGB_colors )

% 229x305 is the size of a 15" screen
projection = zeros(229,305,3);

hFig = displayFullScreen();

for i = 1 : size(RGB_colors,1)
    
    % asign color values to the right channel
    projection(:,:,1) = RGB_colors(i,1); % red channel
    projection(:,:,2) = RGB_colors(i,2); % green channel
    projection(:,:,3) = RGB_colors(i,3); % blue channel
    
    image(projection); pause(1.2);
    
    [message1, message2, cs2000Measurement, colorimetricNames] = CS2000_measure();
    color_data_obj(i) = cs2000Measurement;
    
end

close(hFig);

end

function hFig = displayFullScreen

hFig = figure('units','normalized','outerposition',[0 0 1 1]);

 % get the figure and axes handles
 hFig = gcf;
 hAx  = gca;
 % set the figure to full screen
 set(hFig,'units','normalized','outerposition',[0 0 1 1]);
 % set the axes to full screen
 set(hAx,'Unit','normalized','Position',[0 0 1 1]);
 % hide the toolbar
 set(hFig,'menubar','none')
 % to hide the title
 set(hFig,'NumberTitle','off');
 
end


% Example of RGB colors
function randomColors

nb_colors = 12;
RGB_colors = rand(nb_colors,3);

end