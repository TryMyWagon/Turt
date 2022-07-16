
-- fuelcheck --

function fuelCheck()
    while(turtle.getFuelLevel() < 100) do
        turtle.select(1)
        turtle.placeUp()
        turtle.suckUp()
        turtle.refuel(1)
        turtle.dropUp()
        turtle.digUp()
        turtle.select(2)
    end
end

-- action of harvesting --

function harvest()
    turtle.select(2)
    turtle.dig()
    turtle.suck()
    turtle.suckDown()
    turtle.suck()
    turtle.suckDown()
end

-- harvesting a line --

function harvestLine()
    turtle.turnRight()
    harvest()
    turtle.place()
    turtle.turnLeft()
    turtle.turnLeft()
    harvest()
    turtle.place()
    turtle.turnRight()
end

-- full column of harvesting --

function harvestColumn()
    for row=1,42 do
        harvestLine()
        fuelCheck()
        turtle.forward()
    end
end

-- Turn at the end --

function strafeLeft()
    turtle.turnLeft()
    fuelCheck()
    turtle.up()
    for forward=1,4 do
        fuelCheck()
        turtle.forward()
        fuelCheck()
    end
    turtle.down()
    turtle.turnLeft()
end
    
function strafeRight()
    turtle.turnRight()
    fuelCheck()
    turtle.up()
    for forward=1,4 do
        fuelCheck()
        turtle.forward()
        fuelCheck()
    end
    turtle.down()
    turtle.turnRight()
end

-- START HARVEST --

while true do
    turtle.forward()

    for twoColumns=1,2 do
        harvestColumn()
        harvestLine()
        strafeLeft()
        harvestColumn()
        harvestLine()
        strafeRight()
    end

    harvestColumn()
    harvestLine()
    fuelCheck()
    turtle.forward()
    turtle.turnLeft()

    for return1=1,16 do
        fuelCheck()
        turtle.forward()
    end

    turtle.turnLeft()

    for return2=1,44 do
        fuelCheck()
        turtle.forward()
    end

    turtle.turnLeft()
    turtle.turnLeft()

    -- deposit items --

    for itemDrop=2,16 do
        turtle.select(itemDrop)
        turtle.dropDown()
    end

    turtle.select(2)
    sleep(1800)
end 
