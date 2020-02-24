classdef RobotArm
   properties
      Port
      SerialObj
   end
   methods
       
	function obj = RobotArm(comport)
        if ~exist('comport','var')
            comport=seriallist();
            if isempty(comport)
                error('No COM ports available')
            end
            comport=comport(1);
        end
        obj.Port = comport;
        obj.SerialObj = serial(char(comport),'BaudRate',9600,'Terminator','CR')
        fopen(obj.SerialObj)
        fprintf(obj.SerialObj,"#0P1500#1P1500#2P1500#3P1500#4P1500#5P1500")
        fclose(obj.SerialObj)
	end
       
    function [] = move(obj,channel,position,speed)
        %Defaulting speed to 750 if not specified
        message="";
        if ~exist('speed','var')
            speed = 750;
        end
        if length(speed)==1
            speed=ones(1,length(channel))*speed;
        end
        if length(channel)~=length(position) || length(channel)~=length(speed)|| length(position)~=length(speed)
            error('Size of input arrays not consistent')
        end
        %Spitting out error if position is out of range
        for ii=1:length(position)
        if position(ii)>2500 || position(ii)<500
            error("Position "+num2str(ii)+" out of range (500 to 2500)")
        end
        %Creating output message
        message=message+"#"+channel(ii)+"P"+position(ii)+"S"+speed(ii);
        end
        %Writing message to serial
        fopen(obj.SerialObj)
        fprintf(obj.SerialObj,message)
        fclose(obj.SerialObj)        
    end
    
    function [data] = read(obj,inputchannel)
        if ~exist('inputchannel','var')
            error('no input channel')
        end
        message="V"+inputchannel;
        fopen(obj.SerialObj)
        fprintf(obj.SerialObj,message);
        data = fread(obj.SerialObj,1);
        fprintf(obj.SerialObj,message);
        data = fread(obj.SerialObj,1);
        fclose(obj.SerialObj)
    end

    function [] = moveWait(obj,channel,position,speed)
        %Defaulting speed to 750 if not specified
        if ~exist('speed','var')
            speed = 750;
        end
        if length(speed)==1
            speed=ones(1,length(channel))*speed;
        end
        if length(channel)~=length(position) || length(channel)~=length(speed)|| length(position)~=length(speed)
            error('Size of input arrays not consistent')
        end
        for ii=1:length(position)
        %Spitting out error if position is out of range
            if position(ii)>2500 || position(ii)<500
                error("Position "+num2str(ii)+" out of range (500 to 2500)")
            end
        %Creating output message
        message="#"+channel(ii)+"P"+position(ii)+"S"+speed(ii);
        %Writing message to serial
        fopen(obj.SerialObj)
        fprintf(obj.SerialObj,message);
        data='+';
        while data=='+'
            fprintf(obj.SerialObj,"Q");
            data = fread(obj.SerialObj,1);
            data=char(data);
        end
        fclose(obj.SerialObj)
        end
    end
   end
end