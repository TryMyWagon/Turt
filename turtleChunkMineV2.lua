-- checks and or refuels --
-- requires ender chest lava exchange --

function fuelCheck()
    while(turtle.getFuelLevel() < 500) do
        turtle.select(16)
        turtle.dropDown()
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

-- drops items --

function itemDrop()
    for dropSlot=3,16 do
        turtle.select(dropSlot)
        turtle.dropDown()
    end
end

-- output items --

function outputItems()
    turtle.select(2)
    turtle.digDown()
    turtle.placeDown()
    itemDrop()
    turtle.select(2)
    turtle.dropDown()
    turtle.digDown()
end

-- worldspike --
-- chunk loads the area --

function worldSpikePlace()
    turtle.select(3)
    turtle.digDown()
    turtle.placeDown()
    turtle.select(1)
end

-- gravel check --
-- checks for falling blocks such as sand or gravel --

function fallCheckFront()
    while(turtle.detect() == true) do
        turtle.dig()
        sleep(0.5)
    end
end

function fallCheckUp()
    while(turtle.detectUp() == true) do
        turtle.digUp()
        sleep(0.5)
    end
end

-- advance --
-- 1x3x1 advance in the stripmine --

function advance1()
    fallCheckFront()
    fuelCheck()
    turtle.forward()
    fallCheckUp()
    turtle.digDown()
end

-- stripmine --
-- mines a 16 block long strip mine --

function strip16()
    for strip=1,9 do
        advance1()
    end
end

-- 180 --
-- 180's on the corner at the end of the stripmine to prepare for the next --

function turn180Left()
    turtle.turnLeft()
    fallCheckFront()
    fuelCheck()
    turtle.forward()
    fallCheckUp()
    turtle.digDown()
    turtle.turnLeft()
end

function turn180Right()
    turtle.turnRight()
    fallCheckFront()
    fuelCheck()
    turtle.forward()
    fallCheckUp()
    turtle.digDown()
    turtle.turnRight()
end


--      S T A R T       M I N I N G     --

fallCheckFront()
fuelCheck()
turtle.forward()
fallCheckUp()
turtle.digDown()
turtle.select(4)
turtle.placeDown()

while true do
    strip16()
    fallCheckFront()
    fuelCheck()
    turtle.forward()
    turtle.digDown()
    turtle.select(3)
    turtle.placeDown()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    turtle.turnLeft()
    turn180Left()
    strip16()
    turn180Right()

    for chunk=1,4 do
        strip16()
        turn180Left()
        strip16()
        turn180Right()
    end

    outputItems()
    turtle.turnRight()
    for returnBack=1,10 do
        turtle.forward()
    end
    turtle.turnLeft()
    turtle.select(3)
    turtle.digDown()
    for returnStart=1,10 do
        turtle.forward()
    end
end