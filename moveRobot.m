% Move SSC-32U board joint/servo using the board's serial object as input
% 
% Ahmed Elsaharti 2020

function [] = moveRobot(robotObj,channel,position,speed)
%Defaulting speed to 750 if not specified
if ~exist('speed','var')
    speed = 750;
end
%Spitting out error if position is out of range
if position>2500 || position<500
    error('Position out of range (500 to 2500)')
end
%Creating output message
message="#"+channel+"P"+position+"S"+speed;
%Writing message to serial
writeline(robotObj,message)
end

