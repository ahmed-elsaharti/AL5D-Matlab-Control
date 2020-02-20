% Initialize robot and select comport
% Expected input argument is a string with the COM port that the robot uses
robot=InitializeRobot("COM6");

% Move joint (3) to position (1000) with a given speed (not specified in this case)
% Expected input arguments: moveRobot(robot Object from initialize function, joint number, position (between 500 to 2500), speed)
% Note that if the speed input argument is not provided the function defaults it to 750
moveRobot(robot,3,1000); 

% Read analogue signal (0V to 5V) on input port "H" and map it to a number between 0 and 255 
% Expected input arguments: readRobot(robot Object from initialize function, input port as string)
data = readRobot(robot,"H")
pause
moveRobot(robot,2,2000,750);
pause
moveRobot(robot,2,1500);
pause
moveRobot(robot,2,2000);
pause
clear robot
