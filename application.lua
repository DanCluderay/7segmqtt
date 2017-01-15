-- file : application.lua
local module = {}  
m = nil

-- Sends a simple ping to the broker
local function send_ping(ping_msg)  
--print("===============send ping=====================" .. config.ID)
    ping_path = config.ENDPOINT .. config.ID .. "/Return" 
    print(ping_path)
    m:publish(ping_path,ping_msg,0,0)
end
local function Alive_ping()  
--print("===============send ping=====================" .. config.ID)
    ping_path = config.ENDPOINT .. config.ID .. "/Alive" 
    print(ping_path)
    m:publish(ping_path,"Alive",0,0)
end

-- Sends my id to the broker for registration
local function register_myself()  
    m:subscribe(config.ENDPOINT .. config.ID,0,function(conn)
        print("Successfully subscribed to data endpoint" .. config.ENDPOINT .. config.ID)
        send_ping("Registered")
        gpio.write(1, gpio.HIGH);
    end)
end

local function mqtt_start()  
print("===============mqtt start=====================")
    m = mqtt.Client(config.ID, 120)
    -- register message callback beforehand
    print("===============registered callback2 =====================")
    
    m:on("message", function(conn, topic, data) 
        print("=============== m:  =====================")
      if data ~= nil then
        print(topic .. ": " .. data)
     gpio.write(2, gpio.HIGH);
     arr=mysplit(data)
     print(" arr 1 " .. arr[1])
     print(" arr 2 " .. arr[2])
     print(" arr 2 " .. arr[3])
                 if (arr[1] == "ping") then
                    PrintNumber(arr[2])
                elseif (arr[1]=="Right") then
                    TurnRight(arr[2],arr[3]) 
                    buildoutputarray(arr[2])
                elseif (arr[1]== "1") then
                    
                    PrintNumber(arr[2])
                 else
                    Drive_i(arr[1],arr[2],arr[3], arr[4])
                 end
           
            

            
            print("Finished job: " .. arr[4])
            send_ping("Finished job: " .. arr[4])
            arr=nil
                 gpio.write(2, gpio.LOW);
                
      end
    end)
    -- Connect to broker
    m:connect(config.HOST, config.PORT, 0, 1, function(con) 
        register_myself()
        -- And then pings each 1000 milliseconds
        tmr.stop(6)
        tmr.alarm(6, 10000, 1, Alive_ping)
    end) 

end

function module.start()  
  mqtt_start()
end

return module  
