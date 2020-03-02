classdef RobotArm
   properties
      Port
      SerialObj
   end
   methods
       
	function obj = RobotArm(comport)
        if ~exist('comport','var')
            comport=serialportlist("available");
            if isempty(comport)
                error('No COM ports available')
            end
            comport=comport(1);
        end
        obj.Port = comport;
        obj.SerialObj = serialport(obj.Port,9600);
        configureTerminator(obj.SerialObj,'CR');
        writeline(obj.SerialObj,"#0P1500#1P1500#2P1500#3P1500#4P1500#5P1500")
    end
    
    function [] = stop(obj)
        message="STOP0";
        writeline(obj.SerialObj,message)
        message="STOP1";
        writeline(obj.SerialObj,message)
        message="STOP2";
        writeline(obj.SerialObj,message)
        message="STOP3";
        writeline(obj.SerialObj,message)
        message="STOP4";
        writeline(obj.SerialObj,message)
        message="STOP5";
        writeline(obj.SerialObj,message)
    end    
    
    
    
    function [] = move(obj,channel,position,speed)
        %Defaulting speed to 750 if not specified
        if ~exist('speed','var')
            speed = 750;
        end
        if length(speed)==1
            speed=ones(1,length(channel))*speed;
        else
            error('The move() method does not currently support individual speeds for group move commands')
        end
        if length(channel) ~= length(position) || length(channel) ~= length(speed)
            error('The number of positions must match the number of channels')
        end
        %Spitting out error if position is out of range
        message="";
        for ii=1:length(position)
            if position(ii)>2500 || position(ii)<500
                error("Position "+num2str(ii)+" out of range (500 to 2500)")
            end
            %Creating output message
            message=message+"#"+channel(ii)+"P"+position(ii)+"S"+speed(ii);
        end
        %Writing message to serial
        writeline(obj.SerialObj,message)
    end   
    
    function [data] = read(obj,inputchannel)
        if ~exist('inputchannel','var')
            error('no input channel')
        end
        message="V"+inputchannel;
        writeline(obj.SerialObj,message);
        data = read(obj.SerialObj,1,"uint8");
        writeline(obj.SerialObj,message);
        data = read(obj.SerialObj,1,"uint8");
    end

    function [] = moveWait(obj,channel,position,speed)
        %Defaulting speed to 750 if not specified
        if ~exist('speed','var')
            speed = 750;
        end
        if length(speed)==1
            speed=ones(1,length(channel))*speed;
        end
        if length(channel) ~= length(position) || length(channel) ~= length(speed)
            error('The number of positions and speeds must match the number of channels.')
        end
        for ii=1:length(position)
            %Spitting out error if position is out of range
            if position(ii)>2500 || position(ii)<500
                error("Position "+num2str(ii)+" out of range (500 to 2500)")
            end
            %Creating output message
            message="#"+channel(ii)+"P"+position(ii)+"S"+speed(ii);
            %Writing message to serial
            writeline(obj.SerialObj,message)
            data='+';
            while data=='+'
                writeline(obj.SerialObj,"Q");
                data = read(obj.SerialObj,1,"char");
            end
        end
    end
   end
end