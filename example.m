robot=InitializeRobot("COM6");
moveRobot(robot,3,1000);
data = readRobot(robot,"H")
pause
moveRobot(robot,2,2000,750);
pause
moveRobot(robot,2,1500);
pause
moveRobot(robot,2,2000);
pause
clear robot
