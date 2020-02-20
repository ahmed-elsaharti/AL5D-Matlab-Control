% A control pendant for the AL5D PLTW robot using the SSC-32U board
% Please read the instructions after running the script.
% 
% Ahmed Elsaharti 2020


clear all
clc
comport= input ('Enter COMport in quotes (Ex: "COM4")')
robot=RobotArm(comport);
Servo0=1500;
Servo1=1500;
Servo2=1500;
Servo3=1500;
Servo4=1500;
Servo5=1500;
figure('Name','Pendant','NumberTitle','off');
text="Keep this window in focus and use the following keyboard keys:"+newline+newline+"Servo 0 : 1 = Course increment, Q = Course decrement"+newline+"Servo 1 : 2 = Course increment, W = Course decrement"+newline+"Servo 2 : 3 = Course increment, E = Course decrement"+newline+"Servo 3 : 4 = Course increment, R = Course decrement"+newline+"Servo 4 : 5 = Course increment, T = Course decrement"+newline+"Servo 5 : 6 = Course increment, Y = Course decrement"+newline+"A,S,D,F,G,H = Fine increment for corresponding servos"+newline+"Z,X,C,V,B,N = Fine decrement for corresponding servos"+newline+"Print current servo states : Enter"+newline+"Quit : /";
annotation('textbox',  [0 0 1 1], 'string', text,'VerticalAlignment','middle','HorizontalAlignment','center')
run=1;
while run==1
k = waitforbuttonpress;
value = double(get(gcf,'CurrentCharacter'));
if isempty(value)==0
switch value
    case 49
        if Servo0<=2400
            disp('Servo 0 ++')
            Servo0=Servo0+100;
            robot.move(0,Servo0,1000)
        end
    case 113
        if Servo0>=600
            disp('Servo 0 --')
            Servo0=Servo0-100;
            robot.move(0,Servo0,1000)
        end
    case 97
        if Servo0<=2495
            disp('Servo 0 +')
            Servo0=Servo0+5;
            robot.move(0,Servo0,1000)
        end
    case 122
        if Servo0>=505
            disp('Servo 0 -')
            Servo0=Servo0-5;
            robot.move(0,Servo0,1000)
        end
    case 50
        if Servo1<=2400
            disp('Servo 1 ++')
            Servo1=Servo1+100;
            robot.move(1,Servo1,1000)
        end
    case 119
        if Servo1>=600
            disp('Servo 1 --')
            Servo1=Servo1-100;
            robot.move(1,Servo1,1000)
        end
    case 115
        if Servo1<=2495
            disp('Servo 1 +')
            Servo1=Servo1+5;
            robot.move(1,Servo1,1000)
        end
    case 120
        if Servo1>=505
            disp('Servo 1 -')
            Servo1=Servo1-5;
            robot.move(1,Servo1,1000)
        end
    case 51
        if Servo2<=2400
            disp('Servo 2 ++')
            Servo2=Servo2+100;
            robot.move(2,Servo2,1000)
        end
    case 101
        if Servo2>=600
            disp('Servo 2 --')
            Servo2=Servo2-100;
            robot.move(2,Servo2,1000)
        end
    case 100
        if Servo2<=2495
            disp('Servo 2 +')
            Servo2=Servo2+5;
            robot.move(2,Servo2,1000)
        end
    case 99
        if Servo2>=505
            disp('Servo 2 -')
            Servo2=Servo2-5;
            robot.move(2,Servo2,1000)
        end
    case 52
        if Servo3<=2400
            disp('Servo 3 ++')
            Servo3=Servo3+100;
            robot.move(3,Servo3,1000)
        end
    case 114
        if Servo3>=600
            disp('Servo 3 --')
            Servo3=Servo3-100;
            robot.move(3,Servo3,1000)
        end
    case 102
        if Servo3<=2495
            disp('Servo 3 +')
            Servo3=Servo3+5;
            robot.move(3,Servo3,1000)
        end
    case 118
        if Servo3>=505
            disp('Servo 3 -')
            Servo3=Servo3-5;
            robot.move(3,Servo3,1000)
        end
    case 53
        if Servo4<=2400
            disp('Servo 4 ++')
            Servo4=Servo4+100;
            robot.move(4,Servo4,1000)
        end
    case 116
        if Servo4>=600
            disp('Servo 4 --')
            Servo4=Servo4-100;
            robot.move(4,Servo4,1000)
        end
    case 103
        if Servo4<=2495
            disp('Servo 4 +')
            Servo4=Servo4+5;
            robot.move(4,Servo4,1000)
        end
    case 98
        if Servo4>=505
            disp('Servo 4 -')
            Servo4=Servo4-5;
            robot.move(4,Servo4,1000)
        end
    case 54
        if Servo5<=2400
            disp('Servo 5 ++')
            Servo5=Servo5+100;
            robot.move(5,Servo5,1000)
        end
    case 121
        if Servo5>=600
            disp('Servo 5 --')
            Servo5=Servo5-100;
            robot.move(5,Servo5,1000)
        end
    case 104
        if Servo5<=2495
            disp('Servo 5 +')
            Servo5=Servo5+5;
            robot.move(5,Servo5,1000)
        end
    case 110
        if Servo5>=505
            disp('Servo 5 -')
            Servo5=Servo5-5;
            robot.move(5,Servo5,1000)
        end
    case 13
        disp("----------------------------")
        disp("robot.move(0,"+Servo0+")")
        disp("robot.move(1,"+Servo1+")")
        disp("robot.move(2,"+Servo2+")")
        disp("robot.move(3,"+Servo3+")")
        disp("robot.move(4,"+Servo4+")")
        disp("robot.move(5,"+Servo5+")")
    case 47
        disp('Exiting')
        run=0;
end
end
end
close all
clear robot