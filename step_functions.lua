
local module = {}  


nextjob = "1000"
 

StepMode = 1 --Stepmode=1 (Single) , StepMode = 2 (Double)
        
function DynamicMove(CurrentJob, TheMode , Direction)
RevValue = ""
ForwardVal = ""
--[[print("Current job " .. CurrentJob)
print("The Mode " .. TheMode)
print("Direction " .. Direction)]]--
r =""
    if(tonumber(TheMode)==1) then
         if(CurrentJob == "0000")then
        -- This Job 1000
              RevValue = "0001";
              ForwardVal="1000"
        elseif(CurrentJob == "0001")then
           -- This Job 0100
              RevValue = "0010";
              ForwardVal="1000" 
        elseif(CurrentJob == "0010")then
           -- This Job 0010
              RevValue = "0100";  
              ForwardVal="0001"       
        elseif(CurrentJob == "0100")then
         -- This Job 0001
              RevValue = "1000";    
              ForwardVal="0010"
        elseif(CurrentJob == "1000")then
         -- This Job 1000
              RevValue = "0001";
              ForwardVal="0100"
        elseif(CurrentJob == "1111")then
           -- This Job 0100
              RevValue = "0000";
              ForwardVal="0000"
        end
    elseif(tonumber(TheMode)==2) then
        if(CurrentJob == "0000")then
        -- This Job 1000
              RevValue = "0001";
              ForwardVal="1000"
        elseif(CurrentJob == "0001")then
           -- This Job 0100
              RevValue = "0011";
              ForwardVal="1100" 
        elseif(CurrentJob == "1000")then
           -- This Job 0100
              RevValue = "0011";
              ForwardVal="1001" 
        elseif(CurrentJob == "0011")then
           -- This Job 0010
              RevValue = "0110";  
              ForwardVal="1001"       
        elseif(CurrentJob == "0110")then
         -- This Job 0001
              RevValue = "1100";    
              ForwardVal="0011"
        elseif(CurrentJob == "1100")then
         -- This Job 1000
              RevValue = "1001";
              ForwardVal="0110"
        elseif(CurrentJob == "1001")then
           -- This Job 0100
              RevValue = "0011";
              ForwardVal="1100"
        end
    
    elseif(tonumber(TheMode)==3) then
   if(CurrentJob == "1000")then
        -- This Job 1000
              RevValue = "1110";
              ForwardVal="0111"
        elseif(CurrentJob == "1110")then
           -- This Job 0100
              RevValue = "1101";
              ForwardVal="0111" 
        elseif(CurrentJob == "1101")then
           -- This Job 0010
              RevValue = "1011";  
              ForwardVal="1110"       
        elseif(CurrentJob == "1011")then
         -- This Job 0001
              RevValue = "0111";    
              ForwardVal="1101"
        elseif(CurrentJob == "0111")then
         -- This Job 1000
              RevValue = "1110";
              ForwardVal="1011"
        elseif(CurrentJob == "0000")then
           -- This Job 0100
              RevValue = "0000";
              ForwardVal="0000"
        end
    end

if(tonumber(Direction)==1) then
   r = ForwardVal
else
   r = RevValue
end   
     
nextjob=r

return r
end
function GetNextJobRight(CurrentJob)
--do a lookup on the current jobstring
nj = ""
if(StepMode==1) then
    if(CurrentJob == "0000")then
        -- This Job 1000
              nj = "0001";
        elseif(CurrentJob == "0001")then
           -- This Job 0100
              nj = "0010";
        elseif(CurrentJob == "0010")then
           -- This Job 0010
              nj = "0100";          
        elseif(CurrentJob == "0100")then
         -- This Job 0001
              nj = "1000";    
        elseif(CurrentJob == "1000")then
         -- This Job 1000
              nj = "0001";
        elseif(CurrentJob == "1111")then
           -- This Job 0100
              nj = "0000";
 
        end
end 
if(StepMode==2) then
    if(CurrentJob == "0000")then
        -- This Job 1000
              nj = "1001";
        elseif(CurrentJob == "1001")then
           -- This Job 0100
              nj = "0011";
        elseif(CurrentJob == "0011")then
           -- This Job 0010
              nj = "0110";          
        elseif(CurrentJob == "0110")then
         -- This Job 0001
              nj = "1100";    
        elseif(CurrentJob == "1100")then
         -- This Job 1000
              nj = "1001";
        elseif(CurrentJob == "1111")then
           -- This Job 0100
              nj = "0000";
 
        end
end 
--[[
if(StepMode==3) then
    if(CurrentJob == "0000")then
        -- This Job 1000
              nj = "0111";
        elseif(CurrentJob == "0111")then
           -- This Job 0100
              nj = "1011";
        elseif(CurrentJob == "1011")then
           -- This Job 0010
              nj = "1101";          
        elseif(CurrentJob == "1101")then
         -- This Job 0001
              nj = "1110";    
        elseif(CurrentJob == "1110")then
         -- This Job 1000
              nj = "0111";
        elseif(CurrentJob == "1111")then
           -- This Job 0100
              nj = "0000";
 
        end
end 
    ]]--    
        nextjob=nj
        return nextjob
                -- hold your hourses

end  

function GetNextJobLeft(CurrentJob)
--do a lookup on the current jobstring
nj = ""
if(StepMode==1) then
    if(CurrentJob == "0000")then
        -- This Job 1000
              nj = "1000";
        elseif(CurrentJob == "1000")then
           -- This Job 0100
              nj = "0100";
        elseif(CurrentJob == "0100")then
           -- This Job 0010
              nj = "0010";          
        elseif(CurrentJob == "0010")then
         -- This Job 0001
              nj = "0001";    
        elseif(CurrentJob == "0001")then
         -- This Job 1000
              nj = "1000";
        elseif(CurrentJob == "1111")then
           -- This Job 0100
              nj = "0000";
 
        end
end 
        
        nextjob=nj
                -- hold your hourses

end  


function module.start()  

end

return module 


