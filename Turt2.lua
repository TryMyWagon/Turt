-- Drop Function -- 

function dropItems()
    for dropSlot=2,16 do
        turtle.select(dropSlot)
        turtle.dropDown()
    end
    turtle.select(2)
end

dropItems()

-- Refuel Function --
-- Coal is stored in slot 1 --

function fuelCheck()
    while(turtle.getFuelLevel() < 100) do
        turtle.select(1)
        turtle.refuel(1)
        turtle.select(2)
    end
end

-- Mines a 16x3 long strip mine --
function mine16()
    for stripmine=1,16 do
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.digDown()
    end
end

-- corners at the end of the stripmine --

function left180()
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.turnLeft()
    turtle.digUp()
    turtle.digDown()
end

function right180()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.turnRight()
    turtle.digUp()
    turtle.digDown()
end

-- mining a chunk --

function chunkMine()
    for chunksection=0,3 do
        fuelCheck()
        mine16()
        fuelCheck()
        left180()
        fuelCheck()
        mine16()
        fuelCheck()
        right180()
        print("poopdidyscoop")
    end
end

-- Return code 1 --

function return1()
    turtle.turnRight()
    for return1=0,7 do
        turtle.forward()
        fuelCheck()
    end
    turtle.turnRight()
    turtle.forward()
    dropItems()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    for return2=0,7 do
        turtle.forward()
        fuelCheck()
    end
    turtle.turnRight()
end

-- Return code 2

function return2()
    turtle.turnRight()
    for return3=0,15 do
        turtle.forward()
        fuelCheck()
    end
    turtle.turnRight()
    turtle.forward()
    dropItems()
    turtle.turnRight()
    turtle.turnRight()
end

-- START MINING CODE --

fuelCheck()
turtle.dig()
turtle.forward()
turtle.digUp()
turtle.digDown()
print("MINING")
sleep(5)
chunkMine()
return1()
chunkMine()
return2()