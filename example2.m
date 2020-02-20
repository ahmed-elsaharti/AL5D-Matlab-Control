robot=InitializeRobot("COM6");
disp(['Moving....'])
moveRobotWait(robot,3,1000,100);
disp(['Motion Complete....'])
clear robot

