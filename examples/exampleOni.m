% add the library to the current path
addpath '..'

% flags for enabling plots
enablePlotPhoto = false; % plot of colored people
enablePlotMap = false; % plot of 2D map top-view

% oni files
%videoFilename = 'exampleVideo.oni';
videoFilename = 'S-Medium.oni';
sourceType = 'oni';

vidLen = 450; % number of frames to process - restart from beginning if video ends beforehand

% setup tracker
tracker = setupTracker(sourceType, videoFilename, enablePlotPhoto, enablePlotMap);

for i=1:vidLen
    fprintf('%d/%d\n',i,vidLen);

    % update tracking with current frame information
    [people, potentialObstacles, tracker] = trackPeople(tracker);    
end

% delete tracker
deleteTracker(tracker);