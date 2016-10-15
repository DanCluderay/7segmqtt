-- file : application.lua
local module = {}  
m = nil

-- Sends a simple ping to the broker
local function send_ping()  
--print("===============send ping=====================" .. config.ID)

    m:publish(config.ENDPOINT .. "ping2","id=" .. config.ID,0,0)
end

-- Sends my id to the broker for registration
local function register_myself()  
    m:subscribe(config.ENDPOINT .. config.ID,0,function(conn)
        print("Successfully subscribed to data endpoint" .. config.ENDPOINT .. config.ID)
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
                 if (data == "Left360") then

                    TurnLeft360()
                elseif (data=="Right360") then
                    TurnRigh360() 
                 else
                    TurnRigh360() 
                 end
           
            
             buildoutputarray("L")
            
            print("Finished job")
                 gpio.write(2, gpio.LOW);
                
      end
    end)
    -- Connect to broker
    m:connect(config.HOST, config.PORT, 0, 1, function(con) 
        register_myself()
        -- And then pings each 1000 milliseconds
        tmr.stop(6)
        tmr.alarm(6, 1000, 1, send_ping)
    end) 

end

function module.start()  
  mqtt_start()
end

return module  
