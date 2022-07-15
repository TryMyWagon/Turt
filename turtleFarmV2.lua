
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

turtle.forward()
harvestColumn()