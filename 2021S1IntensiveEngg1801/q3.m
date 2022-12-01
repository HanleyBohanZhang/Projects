% Create a file whose name is the string typed by user
% or print a message, depending on whether the number of 
% uppercase letter in the string greater than the integer n 
% (also typed by user) or not
% The contents of the output file are the last row of 
% the data read from given input filname
% 
% q3(inputFilename)
%
% Lab Test2 Q3
% Author: 500522965

function q3(inputFilename)

   % Read data from input filename
    data = csvread(inputFilename);
    
    % Read a string from user 
    s = input('Enter a string: ','s');
    
    % Read a positive integer from user
    % assume is always positive
    n = input('Enter a integer: ');
    
    % Determine the dimension of data
    [rows, cols] = size(data);
    
    % Get the last row of the data as the output data
    data_output = data(rows,:);
    
    % Create a counter to count the upper case letter in the string
    count = 0;
    % Go through each characters in the string
    for i = 1:length(s)
        
        % Check if the current character is upper case
        % the ascii code of a letter in upper case should be
        % smaller than in letter case
        if s(i) < lower(s(i))
            
            % Remember the number of upper case letters
            count = count +1;
        end
    end
    
    % Compare the number of upper case letter 
    % with the integer typed by user
    % if count upper case number greater than the integer n
    if count > n 
        
        % The name of the output file should be the string
        % and end in csv
        outputFilename = [s, '.csv'];
        
        % Write the output data to the file
        csvwrite(outputFilename, data_output);
      
    % Otherwise, print a message    
    else
        fprintf('Only %d upper case characters in %s\n',count,s);
    end
end

    
    
    
    