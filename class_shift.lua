
local module = {}  

--OE = 5 --gpio 14
--DS = 8 --gpio 04
OE = 5 --gpio 14
DS = 4 --gpio 02
SH = 6 --gpio 12
ST = 7 --gpio 13
T = 9

--nextjob = "1000"
 -- Main Program 
str2="    Hello Nic!!"

gpio.mode(OE, gpio.OUTPUT)
gpio.mode(DS, gpio.OUTPUT)
gpio.mode(SH, gpio.OUTPUT)
gpio.mode(ST, gpio.OUTPUT)


sda = 2-- SDA Pin
scl = 1-- SCL Pin

--StepMode = 1 --Stepmode=1 (Single) , StepMode = 2 (Double)
        
outputarray = {}
m1_temp = {}

function SetOutPutToAllZeros()
    outputenabled_on(0);
        for y=1, 4 ,1
            do pulse(0)       
        end
    outputenabled_on(1);
end



function outputenabled_on(val)


    if (val == 0) then
        gpio.write(OE, gpio.HIGH);
    else
        gpio.write(OE, gpio.LOW);
    end
end

function pulse(On)
-- look at the existing ouptarray and check for jobs not done
            gpio.write(SH, gpio.LOW);
            if (On==1) then
                        gpio.write(DS, gpio.HIGH);
            else
                        gpio.write(DS, gpio.LOW);
            end 

            gpio.write(SH, gpio.HIGH);
            --tmr.delay(200)
            gpio.write(SH, gpio.LOW);        
            --clock
            gpio.write(ST, gpio.LOW);
          

            --tmr.delay(200)
            gpio.write(ST, gpio.HIGH);
            --tmr.delay(200)
            gpio.write(ST, gpio.LOW);
       
end

function PrintNumber(num)
    outputenabled_on(0);
    print("SSD " .. num)
    if(tostring(num)=="1") then
        pulse(0);--Dot
        pulse(1);--C
        pulse(0);--d
        pulse(0);--e
        pulse(1);--b
        pulse(0);--a
        pulse(0);--f
        pulse(0);--g
        
    elseif (tostring(num)=="2") then
        pulse(0);--Dot
        pulse(0);--C
        pulse(1);--d
        pulse(1);--e
        pulse(1);--b
        pulse(1);--a
        pulse(0);--f
        pulse(1);--g
        
    elseif (num=="3") then
        pulse(0);--Dot
        pulse(1);--C
        pulse(1);--d
        pulse(0);--e
        pulse(1);--b
        pulse(1);--a
        pulse(0);--f
        pulse(1);--g
    elseif (num=="4") then
        pulse(0);--Dot
        pulse(1);--C
        pulse(0);--d
        pulse(0);--e
        pulse(1);--b
        pulse(0);--a
        pulse(1);--f
        pulse(1);--g
    elseif (num=="5") then
        pulse(0);--Dot
        pulse(1);--C
        pulse(1);--d
        pulse(0);--e
        pulse(0);--b
        pulse(1);--a
        pulse(1);--f
        pulse(1);--g
    elseif (num=="6") then
        pulse(0);--Dot
        pulse(1);--C
        pulse(1);--d
        pulse(1);--e
        pulse(0);--b
        pulse(1);--a
        pulse(1);--f
        pulse(1);--g
    elseif (num=="7") then
        pulse(0);--Dot
        pulse(1);--C
        pulse(0);--d
        pulse(0);--e
        pulse(1);--b
        pulse(1);--a
        pulse(0);--f
        pulse(0);--g
    elseif (num=="8") then
        pulse(0);--Dot
        pulse(1);--C
        pulse(1);--d
        pulse(1);--e
        pulse(1);--b
        pulse(1);--a
        pulse(1);--f
        pulse(1);--g
    elseif (num=="9") then
        pulse(0);--Dot
        pulse(1);--C
        pulse(1);--d
        pulse(0);--e
        pulse(1);--b
        pulse(1);--a
        pulse(1);--f
        pulse(1);--g
    elseif (num=="0") then
        pulse(0);--Dot
        pulse(1);--C
        pulse(1);--d
        pulse(1);--e
        pulse(1);--b
        pulse(1);--a
        pulse(1);--f
        pulse(0);--g
    elseif (num=="-") then
        pulse(0);--Dot
        pulse(0);--C
        pulse(0);--d
        pulse(0);--e
        pulse(0);--b
        pulse(0);--a
        pulse(0);--f
        pulse(0);--g
    end
    
   
    outputenabled_on(1);
end


function mysplit(inputstr)
    
        local t={} ; i=1
       for token in string.gmatch(inputstr, "[^%s]+") do
                t[i] = token
                i = i + 1
        end

        return t
end

function module.start()  

end

return module 


