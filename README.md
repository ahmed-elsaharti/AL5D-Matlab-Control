# AL5D-Matlab-Control
A MATLAB class + methods to control the Lynxmotion AL5D (SSC-32U Board) robot and take input readings from the control board

> # NOTE: Use the code in this branch of the project **ONLY** if you're using a version of MATLAB higher than 2017a and lower than 2019b.
> # If you are using MATLAB 2019b, use the code in the **master** branch (https://github.com/ahmed-elsaharti/AL5D-Matlab-Control/tree/master) for better performance.

<p align="center">
<img src="https://www.robotshop.com/media/catalog/product/cache/image/1350x/9df78eab33525d08d6e5fb8d27136e95/l/y/lynxmotion-al5d-pltw-robotic-arm-kit-w-flowarm-pltw-app.jpg" width=50% align="center">
</p>

(See https://www.robotshop.com/media/files/pdf2/lynxmotion_ssc-32u_usb_user_guide.pdf to know which are the input channel pins and which are servo channel pins)

# Description

#### See example.m to see how to combine the points explained below.

> Note that you **MUST**:
> * Initialize the robot (as shown below) to perform any action.
> * Clear/exit the robot object (as shown below) at the end of your code.

#### See the pendant section below to understand how to use the pendant.m script.

## 1. Initialization

```Matlab
r = RobotArm(COMPORT) 
```
Will initialize the serial object by specifying the COM port **COMPORT** and will move all the servos to their center positions. (r is an example variable)

> **NOTE: RobotArm is case sensitive**

If you do not know what COM port the robot is connected to don't pass any input arguments as follows and the program will connect to the first available port:

```Matlab
r = RobotArm()
```

If you know the COM port, you can pass it as a __string__ argument in quotes:
```Matlab
r = RobotArm("COM6")
```

## 2a. Moving the robot

```Matlab
r.move(joint,position,speed) 
```
Moves the servo specified by **joint** to the location __(between 500 and 2500)__ specified by **position** at the rate of **speed** within the serial object **r**

### Example:
```Matlab
r.move(3,1000,200)
```
This command moves servo **3** to position **1000** at a speed of **200**


> Note that if you do not pass a speed value the default value is set to 750
> ### Example:
> ```Matlab
> r.move(3,1000)
> ```
> This command moves servo **3** to position **1000** at a default speed of 750

## 2b. Moving and wait for completion

```Matlab
r.moveWait(joint,position,speed)
```
Moves the servo specified by **joint** to the location __(between 500 and 2500)__ specified by **position** at the rate of **speed** within the serial object **r** and will halt the execution of the script untill the joint movement is completed.

### Example:
```Matlab
disp('Motion started...')
r.moveWait(3,1000,200)
disp('You will see this when both motions are complete...')
```
Running this command will display 'Motion started...' and will start moving servo **3** to position **1000** at a speed of **200**.
The program will halt at the second line untill the motion is complete. Only when servo **3** reaches position **1000** will the command window display 'You will see this when both motions are complete...'

> Note that similar to the *move()* method if you do not pass a speed value the default value is set to 750

## 3. Reading input channels

```Matlab
r.read(inputchannel)
```

Reads an analogue signal between 0V and 5V at the input pin specified by **inputchannel** and maps it to a value between 0 and 255 

### Example:
```Matlab
data = r.read("H")
```
Running this command will assign the mapped value of pin **"H"** to the variable **data**

> Note that you need to pass the input pin's capital letter label as a __string__ between quotes: "A","B",etc.
>
> (See https://www.robotshop.com/media/files/pdf2/lynxmotion_ssc-32u_usb_user_guide.pdf to know where the input pin labels are printed)


## 4. Exiting
```Matlab
clear r
```
Clears the robot object.


Always remember to perform this step at the end of your MATLAB code.

---

# Pendant

On running the pendant script you will be asked to input the **COM Port** in quotes: 
```Matlab
Enter COMport in quotes (Ex: "COM4")
```
Enter the port in quotes and press **Enter**.

> You can use 
> ```Matlab
> seriallist()
> ```
> to find the COM port

You will then see the following figure:
<p align="center">
<img src="https://i.imgur.com/FP8GbFy.png" width=50% align="center">
</p>


Make sure you keep the figure window in focus (do not click any other window during operation)


With the figure window in focus you can control the robot using your keyboard (see map below and/or instructions on figure) and print the list of commands that would move the robot the the current position by pressing **Enter**.

<p align="center">
<img src="https://i.imgur.com/ICRfKdH.jpg" width=90% align="center">
</p>

This is an example of the printed list of servo positions:
```Matlab
robot.move(1,1500)
robot.move(2,1200)
robot.move(3,1540)
robot.move(4,600)
robot.move(5,1400)
robot.move(6,2400)
```
> Note: Press the **/** button (with the window in focus) to exit 
