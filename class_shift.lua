
local module = {}  

--OE = 5 --gpio 14
--DS = 8 --gpio 04
OE = 5 --gpio 14
DS = 4 --gpio 02
SH = 6 --gpio 12
ST = 7 --gpio 13

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


function createoutputarray(teststring)

    stringlen = 0; --clean
    stringlen = string.len(teststring);
    if (stringlen < 1) then
        print("Not long enough");
    return; 
    end
    m1_len = 1;--clean
    arraylenght = 0;--clean
  
    for i = 1,stringlen 
      do 
      newstring = string.byte(teststring,i,(i + 1))
      if (newstring == 48) then
        --its a zero
   
        table.insert(m1_temp,m1_len,0);
        m1_len = m1_len + 1;
    
      end
      if (newstring == 49) then
        --its a one

        table.insert(m1_temp,m1_len,1);
        m1_len = m1_len + 1;
    
      end
   end
   
   --clean up
   stringlen = nil;
   m1_len = nil;
   arraylenght = nil;
   newstring = nil;
   collectgarbage();
end

function SetOutPutToAllZeros()
    outputenabled_on(0);
        for y=1, 4 ,1
            do pulse(0)       
        end
    outputenabled_on(1);
end

function buildoutputarray(degrees)
totalsteps = tonumber(degrees) 
    for i = 1, totalsteps, 1

        do createoutputarray(outputarray[i])

        outputenabled_on(0);
        --print(outputarray[i]);
        --print(node.heap());
        for y=1, 4 ,1
            do pulse(m1_temp[y])
            --m1_temp = nil; --memory clean up
        
        end
        outputenabled_on(1);
      
           tmr.delay(10) 
    end
    --outputarray = {}
    --m1_temp = {}
    print("Finished loop")
    SetOutPutToAllZeros()
    --SetOutPutToAllZeros=nil
        collectgarbage();
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

function Drive_i(direction, degrees, form)
   print("Total degrees " .. degrees)
totalsteps = tonumber(degrees) 
nextjob = "1000"
    --outputarray = {}
   -- m1_temp = {}
   print("Total form " .. form)
   print("Total direction " .. direction)
              for i=1,totalsteps, 1
                do 
                nextjob1=0
                nextjob1= DynamicMove(nextjob,form,direction);   
                print("Next Job " .. nextjob1)
                --print(nextjob1)
                tmr.delay(10) 
                stringlen = string.len(nextjob1);
                --print("String len " .. stringlen)
                outputenabled_on(0);
                
                for i = 1, stringlen
                    do 
                    newstring = string.byte(nextjob1,i,(i + 1))
                    --print("New string bin " .. newstring)
                    if (newstring == 48) then
                    --its a zero
                        pulse(0)
                    end
                    if (newstring == 49) then
                        --its a one
                       pulse(1)
                    end
                    --newstring=nil
                end
                --stringlen=nil
                outputenabled_on(1);
             
              end   
    SetOutPutToAllZeros()
    print("Print DOne");
    --nextjob=nil
    collectgarbage(); 
end   

function TurnLeft(degrees, form)

totalsteps = tonumber(degrees) 

    outputarray = {}
    m1_temp = {}
              for i=1,totalsteps, 1
                do print(i) 
                stepposition=i;

                GetNextJobRight(nextjob);
                outputarray[i] = nextjob
                print(nextjob);    
              end

    collectgarbage();
  
    print("Print DOne");
    
end     
function TurnRight(degrees, form)
totalsteps = tonumber(degrees) 
    outputarray = {}
    m1_temp = {}
              for i=totalsteps,1, -1 
                do print(i) 
                stepposition=i;
                GetNextJobRight(nextjob);
                outputarray[i] = nextjob
                print(nextjob);
    
              end

    collectgarbage();
    print("Print DOne");
    
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


