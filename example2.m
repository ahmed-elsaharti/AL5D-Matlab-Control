robot=InitializeRobot("COM6");
disp(['Moving....'])

% Move joint (3) to position (1000) with a given speed (100) and wait for the motion to be complete before proceeding to the next line
% Expected input arguments: moveRobot(robot Object from initialize function, joint number, position (between 500 to 2500), speed)
% Note that if the speed input argument is not provided the function defaults it to 750
moveRobotWait(robot,3,1000,100);
disp(['Motion Complete....'])
clear robot

