-- PLACING QUARRY --

-- Fuel chest slot 1 --
-- wire slot 2 --
-- pipe slot 3 --
-- quarry slot 4 --
-- Quarry output chest slot 5 --
-- power cell full chest slot 6 --
-- power cell empty chest slot 7 --


function fuelCheck()
    while(turtle.getFuelLevel() < 500) do
        turtle.select(16)
        turtle.digDown()
        turtle.dropDown()
        turtle.select(1)
        turtle.placeDown()
        turtle.suckDown(1)
        turtle.refuel(1)
        turtle.dropDown()
        turtle.digDown()
    end
end

function purgeItems()
    for purgeSlot=8,16 do 
        turtle.select(purgeSlot)
        turtle.dropDown()
    end
end

function freshCell()
    turtle.select(16)
    turtle.digDown()
    turtle.dropDown()
    turtle.select(6)
    turtle.placeDown()
    turtle.suckDown(1)
    turtle.placeUp()
    turtle.digDown()
end

function depletedCell()
    turtle.select(16)
    turtle.digDown()
    turtle.dropDown()
    turtle.select(7)
    turtle.placeDown()
    turtle.digUp()
    turtle.dropDown()
    turtle.digDown()
end

function reverse1()
    for r=1,2 do
        turtle.turnRight()
    end
    turtle.forward()
    for r=1,2 do
        turtle.turnRight()
    end
end

function advanceChunk()
    for move=1,9 do
        fuelCheck()
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.digDown()
    end
    purgeItems()
end

function placeQuarry()
    fuelCheck()
    turtle.select(16)
    turtle.digUp()
    turtle.dropDown()
    freshCell()
    reverse1()
    turtle.select(2)
    turtle.place()
    turtle.select(3)
    turtle.placeUp()
    turtle.turnRight()
    turtle.select(16)
    turtle.dig()
    turtle.dropDown()
    turtle.forward()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.select(4)
    turtle.place()
    turtle.turnLeft()
    turtle.select(16)
    turtle.dig()
    turtle.dropDown()
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
    turtle.select(3)
    turtle.placeUp()
    reverse1()
    turtle.select(5)
    turtle.place()
end

function pickUpQuarry()
    turtle.select(5)
    turtle.dig()
    turtle.forward()
    turtle.select(3)
    turtle.digUp()
    turtle.select(4)
    turtle.dig()
    turtle.forward()
    turtle.select(3)
    turtle.digUp()
    turtle.select(2)
    turtle.dig()
    turtle.forward()
    depletedCell()
end

turtle.turnRight()

while true do
    fuelCheck()
    placeQuarry()
    fuelCheck()
    sleep(720)
    pickUpQuarry()
    advanceChunk()
end 