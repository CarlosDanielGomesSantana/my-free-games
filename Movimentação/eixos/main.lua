function love.load()
    WIDTH, HEIGHT = love.graphics.getDimensions()
    WHITE_COLOR = {1, 1, 1}
    RED_COLOR = {1, 0, 0}
    DIVISOR = {5, 10, 20, 40, 50, 100, 200}
    INDEX_DIVISOR = 1
    SQUARE_X, SQUARE_Y = 0, 0
end

function love.wheelmoved(x, y)
    if y > 0 then
        INDEX_DIVISOR = INDEX_DIVISOR < #DIVISOR and INDEX_DIVISOR + 1 or INDEX_DIVISOR
        SQUARE_X, SQUARE_Y = 0, 0
    elseif y < 0 then
        INDEX_DIVISOR = INDEX_DIVISOR > 1 and INDEX_DIVISOR - 1 or INDEX_DIVISOR
        SQUARE_X, SQUARE_Y = 0, 0
    end
end

function love.keypressed( key, scancode, isrepeat )
    if scancode == "right" and SQUARE_X < WIDTH - SQUARE_X/2 then
        SQUARE_X = SQUARE_X + DIVISOR[INDEX_DIVISOR]
    elseif scancode == "left" and 0 < SQUARE_X  then
        SQUARE_X = SQUARE_X - DIVISOR[INDEX_DIVISOR]
    elseif scancode == "down" and SQUARE_Y < HEIGHT - SQUARE_Y/2 then
        SQUARE_Y = SQUARE_Y + DIVISOR[INDEX_DIVISOR]
    elseif scancode == "up" and 0 < SQUARE_Y then
        SQUARE_Y = SQUARE_Y - DIVISOR[INDEX_DIVISOR]
    end
 end

function love.draw()
    love.graphics.setLineWidth(1)
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

    love.graphics.setColor(RED_COLOR)

    love.graphics.setLineWidth(3)
    love.graphics.rectangle(
        "line",
        SQUARE_X, SQUARE_Y,
        DIVISOR[INDEX_DIVISOR],
        DIVISOR[INDEX_DIVISOR]
    )

end

