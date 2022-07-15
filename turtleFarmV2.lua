
-- fuelcheck --

function fuelCheck()
    while(turtle.getFuelLevel() < 100) do
        turtle.select(1)
        turtle.placeUp()
        turtle.suckUp()
        turtle.refuel(1)
        turtle.dropUp()
        turtle.digUp()
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
    turtle.turnLeft()
    turtle.turnLeft()
    harvest()
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

harvestColumn()