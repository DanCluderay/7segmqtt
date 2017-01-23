
local module = {}  

OE = 5 --gpio 14
DS = 4 --gpio 02
SH = 6 --gpio 12
ST = 7 --gpio 13
T = 9

str2="    Hello Nic!!"

gpio.mode(OE, gpio.OUTPUT)
gpio.mode(DS, gpio.OUTPUT)
gpio.mode(SH, gpio.OUTPUT)
gpio.mode(ST, gpio.OUTPUT)


sda = 2-- SDA Pin
scl = 1-- SCL Pin

a = {} -- the output array
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
            tmr.delay(100)
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

function outputnumbertoSSD()
    --get the array
    for p = 1 , 100 do
   
        for i = 1 , 7 do
            -- this is printing the
            thestring = a[i]
            print("The String " .. thestring)
            --print(node.heap())
            outputenabled_on(0)
            for y = 1, 16 do
                theChar = string.sub(thestring,1,y+1)
                if (theChar=="1") then
                    pulse(1)
                elseif (theChar=="0") then
                    pulse(0)
                else
                    pulse(0)
                end
            end
            outputenabled_on(1)
        end
        --thestring = nil
        --theChar = nil
        --outputenabled_on = nil
        --pulse = nil
        collectgarbage()

    end
    --loop it 
    --loop the loop 1000 times

end

function mysplit(inputstr)
    
        local t={} ; i=1
       for token in string.gmatch(inputstr, "[^%s]+") do
                t[i] = token
                i = i + 1
        end

        return t
end


function CreateArray(the_num)
    maxOutputArray = 7
    -- calculate the lenght of the_num
    num_len = string.len(the_num)
    reverse_pos = maxOutputArray-num_len --when to start showing the numbers
    

    counting_dig = 0
    for i = 1 ,maxOutputArray do -- creates an array 8 long (limited to 7 by the size of darling array chip)
        digit_display = "" -- pin output configation "00101011"
        digit_position = "" -- pin out config "0000001"
        
        if  reverse_pos < i then
            -- a real number is going to go in here    
            counting_dig = counting_dig + 1
            di = string.sub(tostring(the_num), counting_dig, counting_dig + 1)
            digit_display = ret_displaydigit(di)
            digit_position = ret_displaydigitPosition(counting_dig)
        else
            --this position will be blank
            digit_display = "00000000" -- set to do nothing
            digit_position = "00000000" -- set to do nothing
        end

        a[i] = digit_position .. digit_display
        print(a[i])
    end    
end

function ret_displaydigit(posi)
    ret_string = ""
    if(tostring(posi) == "1") then
        ret_string="00010010"
    elseif (tostring(posi) == "2") then
        ret_string="10111100"
    elseif (tostring(posi) =="3") then
        ret_string="10110110"
    elseif (tostring(posi) =="4") then
        ret_string="11010010"
    elseif (tostring(posi) =="5") then
        ret_string="11100110"
    elseif (tostring(posi) =="6") then
        ret_string="11101110"
    elseif (tostring(posi) =="7") then
        ret_string="00110010"
    elseif (tostring(posi) =="8") then
        ret_string="11111110"
    elseif (tostring(posi) =="9") then
        ret_string="11110110"
    elseif (tostring(posi) =="0") then
        ret_string="01111110"
    elseif (tostring(posi) =="-") then
        ret_string="00000000"
    else 
        ret_string="00000000"
    end
    
    return ret_string
end


function ret_displaydigitPosition(posi)
    ret_string = ""
    if (tostring(posi) == "1") then
        ret_string = "10000000"
    elseif (tostring(posi) == "2") then
        ret_string = "01000000"
    elseif (tostring(posi) == "3") then
        ret_string = "00100000"
    elseif (tostring(posi) == "4") then
        ret_string = "00010000"
    elseif (tostring(posi) == "5") then
        ret_string = "00001000"
    elseif (tostring(posi) == "6") then
        ret_string = "00000100"
    else 
        ret_string = "00000000"
    end
    
    return ret_string
end
function module.start()  

end
return module 

