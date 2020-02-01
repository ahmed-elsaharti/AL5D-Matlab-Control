# AL5D-Matlab-Control
MATLAB functions to control the Lynxmotion AL5D (SSC-32U Board) robot and take input readings from the control board

1. Use initialize function to set the COM port and create the serial object before using the other functions.
2. moveRobot and readRobot require the serial object created by InitializeRobot as an input argument.
3. Always clear the serial object at the end of the script (see example)
