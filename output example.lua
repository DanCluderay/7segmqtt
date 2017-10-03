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