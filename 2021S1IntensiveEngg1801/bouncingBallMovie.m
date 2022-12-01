% Create a movie with 3 bouncing balls moving diagonally 
% and bouncing off the wall
% also, there is a hole, when the ball reach the hole
% the ball will disappeared
% 
% bouncingBallMovie()
% Lab Test 2 Q4
% Author: 500522965


function bouncingBallMovie() 

    % Plot in figure 1
    figure(1);

    % Clear existing figure and reset plotting properties
    clf;
    clf reset;
    

    % Prepare to create the movie (.avi) file
    video = VideoWriter('bouncingBall.avi');
    open(video);

    % Create a matrix with 32 rows and 29 columns; all values are 0
    matrix = zeros(32,29);
    
    % Find out how many rows and columns are in the matrix; note y before x
    [maxY, maxX] = size(matrix); 

    % Note the minimum possible x and y values
    minX = 1;
    minY = 1; 

    % Initial position of 3 balls
    % Ball 1
    x1 = 5;
    y1 = 2;
    
    % Ball 2
    x2 = 21;
    y2 = 1;
    
    % Ball 3
    x3 = 9;
    y3 = 26;

    % Initial rate of change of ball along x and y axes
    % The three balls all go diagonally
    % Ball 1
    dx1 = 1;
    dy1 = 2;
    
    % Ball 2
    dx2 = 1;
    dy2 = 2;
    
    % Ball 3
    dx3 = 1;
    dy3 = 2;
    
    
    % Current color for all pixels in the matrix
    BG_COLOR = 0;
    
    % Color for active pixel in matrix (where the ball is)
    % Ball 1
    color1 = 1;
    color2 = 1;
    color3 = 1;
    
    % The coordinate of the top left pixel of the hole
    % (16,14), wichi the 14 is the row number, and 16 is the colum number
    % The length of the hole and the width of the hole both are 2
    % So the coordinate of the hole should be (16:16+1,14:14+1,:)
    % Set the hole as another color
    matrix(14,16,:) = 3;
    matrix(15,16,:) = 3;
    matrix(14,17,:) = 3;
    matrix(15,17,:) = 3;
    

    % Choose the colors to be used in the movie
    colormap hot;

	% For each of the 500 frames in the movie 
    for step = 1:500
        
        % Put the  3 ball at appropriate location (x,y); note y before x
        matrix(y1, x1) = color1;
        matrix(y2, x2) = color2;
        matrix(y3, x3) = color3;
        
        % Get the next frame (image)
        imagesc(matrix);
        
        % Change color of where the  3 ball is back to background color  
        matrix(y1, x1) = 0;
        matrix(y2, x2) = 0;
        matrix(y3, x3) = 0;
        
        % Get a frame (same as the image shown above), and store into the video
        frame = getframe();
        writeVideo(video, frame);
        
        
        % Ball 1:
        % If the next change in coordinates will put us outside of the range,
        % then negate the appropriate dx or dy (change directions = bounce)
        if (x1 + dx1 > maxX && dx1 > 0) || (x1 + dx1 < minX && dx1 < 0)
            dx1 = -1 * dx1;
        end
        if (y1 + dy1 > maxY && dy1 > 0) || (y1 + dy1 < minY && dy1 < 0)
            dy1 = -1 * dy1;
        end
        
        
        % Ball 2:
        % If the next change in coordinates will put us outside of the range,
        % then negate the appropriate dx or dy (change directions = bounce)
        if (x2 + dx2 > maxX && dx2 > 0) || (x2 + dx2 < minX && dx2 < 0)
            dx2 = -1 * dx2;
        end
        if (y2 + dy2 > maxY && dy2 > 0) || (y2 + dy2 < minY && dy2 < 0)
            dy2 = -1 * dy2;
        end
        
        
        % Ball 3:
        % If the next change in coordinates will put us outside of the range,
        % then negate the appropriate dx or dy (change directions = bounce)
        if (x3 + dx3 > maxX && dx3 > 0) || (x3 + dx3 < minX && dx3 < 0)
            dx3 = -1 * dx3;
        end
        if (y3 + dy3 > maxY && dy3 > 0) || (y3 + dy3 < minY && dy3 < 0)
            dy3 = -1 * dy3;
        end
        
        
        
        % Move all the  3ball
        x1 = x1 + dx1;
        y1 = y1 + dy1;
        x2 = x2 + dx2;
        y2 = y2 + dy2;
        x3 = x3 + dx3;
        y3 = y3 + dy3;
        
        % Add 0.5s delay to make the video
        % appear properly on Matlab Online
%         pause(0.5);
        
        
        % Ball 1:
        % Check if the ball enter the hole
        % Which means the current coordinates of the ball
        % is within the coordinate of the hole
        if (x1 <= 17 && x1 >= 16) && (y1 >=14 && y1 <= 15)
            
            % Stop moving the ball
            dx1 = 0;
            dy1 = 0;
            
            % Changee the ball color same as the hole
            color1 = 3;
        end
        
        % Ball 2:
        if (x2 <= 17 && x2 >= 16) && (y2 >=14 && y2 <= 15)
            
            % Stop moving the ball
            dx2 = 0;
            dy2 = 0;
            
            % Changee the ball color same as the hole
            color2 = 3;
        end
        
        % Ball 3:
        if (x3 <= 17 && x3 >= 16) && (y3 >=14 && y3 <= 15)
            
            % Stop moving the ball
            dx3 = 0;
            dy3 = 0;
            
            % Changee the ball color same as the hole
            color3 = 3;
        end
        
    end

    % Close the file so that it saves properly
    close(video);
end
