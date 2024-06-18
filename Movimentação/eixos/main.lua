function love.load()
    WIDTH, HEIGHT = love.graphics.getDimensions()
    WHITE_COLOR = {1, 1, 1}
    DIVISOR = {5, 10, 20, 40, 50, 100, 200}
    INDEX_DIVISOR = 1
end

function love.wheelmoved(x, y)
    if y > 0 then
        INDEX_DIVISOR = INDEX_DIVISOR < #DIVISOR and INDEX_DIVISOR + 1 or INDEX_DIVISOR
    elseif y < 0 then
        INDEX_DIVISOR = INDEX_DIVISOR > 1 and INDEX_DIVISOR - 1 or INDEX_DIVISOR
    end
end

function love.draw()
    love.graphics.setColor(WHITE_COLOR)

    for point = 0, WIDTH, DIVISOR[INDEX_DIVISOR] do
        love.graphics.line(
            point, -- The position of first point on the x-axis.
            0,     -- The position of first point on the y-axis.
            point, -- The position of second point on the x-axis.
            HEIGHT -- The position of second point on the y-axis.
        )
        love.graphics.line(
            0,     -- The position of first point on the x-axis.
            point, -- The position of first point on the y-axis.
            WIDTH, -- The position of second point on the x-axis.
            point  -- The position of second point on the y-axis.
        )
    end
end

