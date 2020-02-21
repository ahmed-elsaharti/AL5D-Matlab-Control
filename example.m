clear all
clc

%% Initialization

% r = RobotArm(COMPORT) will initialize the serial object by specifying the COM port 'COMPORT'
% and will move all the servos to their center positions.

% If you do not know what COM port the robot is connected to don't pass
% any input arguments as follows and the program will connect to the first available port:
r = RobotArm()
% If you know the COM port, you can pass it as a string argument in quotes:
% r = RobotArm("COM6")

%% Moving the robot

% r.move(joint,position,speed) moves the servo specified by 'joint' to the
% location (between 500 and 2500) specified by 'position' at the rate of
% 'speed' within the serial object 'r'
r.move(3,1000,200)
disp('First motion is still ongoing')
r.move(4,1000,200)
% Note that if you do not pass a speed value the default value is set to
% 750:
% r.move(3,1000) moves servo 3 to position 1000 at a default speed of 750


disp('Press and key to continue')
pause


% r.moveWait(joint,position,speed) moves the servo specified by 'joint' to the
% location (between 500 and 2500) specified by 'position' at the rate of
% 'speed' within the serial object 'r' and will halt the execution of the
% script untill the joint movement is completed
disp('Motion started...')
r.moveWait(4,1500,200)
disp('First motion complete, second motion starting...')
r.moveWait(3,1500,200)
disp('You will see this when both motions are complete...')
% Note that if you do not pass a speed value the default value is set to
% 750:
% r.move(3,1000) moves servo 3 to position 1000 at a default speed of 750

%% Reading inputs

% r.read(inputchannel) reads an analogue signal between 0V and 5V at
% input pin specified by 'inputchannel' and map it to a value between 0 and
% 255
data = r.read("H")
% Note that you need to pass the input pin's capital letter as a string between
% quotes: "A","B",etc.

%% Exiting

% Remember to clear the robot object as follows:
clear r