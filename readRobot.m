% Read SSC-32U board sensor using the board's serial object as input in
% addition to the input channel's name as a string (Example:
% readRobot(s,"H"))
% 
% Ahmed Elsaharti 2020

function [data] = readRobot(robotObj,inputchannel)
if ~exist('inputchannel','var')
    error('no input channel')
end
    message="V"+inputchannel;
    writeline(robotObj,message);
    data = read(robotObj,1,"uint8");
    writeline(robotObj,message);
    data = read(robotObj,1,"uint8");
end

