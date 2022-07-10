u = 0
x = 0

function fuelCheck()
    while(turtle.getFuelLevel() < 100) do
        turtle.refuel(1)
    end
end

function MINE()
    while u < 10 do
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.digDown()
        u = u + 1
    end
end

function turnLeft()
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()
    turtle.turnLeft()
    u = 0
end

function turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()
    turtle.turnRight()
    u = 0
end

while x < 5 do
    fuelCheck()
    MINE()
    u = 0
    fuelCheck()
    turnLeft()
    fuelCheck()
    MINE()
    u = 0
    fuelCheck()
    turnRight()
    x = x + 1
end


-- Cobblecheck Function --
-- not functioning --
-- function cobbleCheck() --
--    for slotNum=2,16 do --
--        turtle.select(slotNum) --
--        local item = turtle.getItemDetail(slot) --
--        if(item["name"] == "minecraft:cobblestone") then --
--        turtle.select(slot) --
--        turtle.dropDown() --
--    end --
-- end --