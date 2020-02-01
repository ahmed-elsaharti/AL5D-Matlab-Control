% Initialize a serial connection with the COM port (string) specified with a baud
% rate of 9600 (the default rate for the SSC-32U board) then sets all the
% servos at 1500 (midpoint) (Example : InitializeRobot("COM6"))
% 
% Ahmed Elsaharti 2020

function [robotObj] = InitializeRobot(COMPort)
    robotObj = serialport(COMPort,9600);
    configureTerminator(robotObj,'CR');
    writeline(robotObj,"#0P1500#1P1500#2P1500#3P1500#4P1500#5P1500")
end

