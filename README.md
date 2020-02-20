# AL5D-Matlab-Control
MATLAB functions to control the Lynxmotion AL5D (SSC-32U Board) robot and take input readings from the control board


<p align="center">
<img src="https://www.robotshop.com/media/catalog/product/cache/image/1350x/9df78eab33525d08d6e5fb8d27136e95/l/y/lynxmotion-al5d-pltw-robotic-arm-kit-w-flowarm-pltw-app.jpg" width=50% align="center">
</p>

(See https://www.robotshop.com/media/files/pdf2/lynxmotion_ssc-32u_usb_user_guide.pdf to know which are the input channel pins and which are servo channel pins)

For an example on how to use functions, see example.m

1. Use the initialize function (InitializeRobot.m) to set the COM port and create the serial object before using the other functions.
2. Use moveRobot and readRobot to move servos to particular positions and to read signal off one of the input channels (these require the serial object created by InitializeRobot as an input argument).
3. Always clear the serial object at the end of the script (see example.m)
4. A pendant script has been added.
5. Use moveRobotWait if you want MATLAB to wait untill the current motion is complete before proceeding further. (see example2.m)

