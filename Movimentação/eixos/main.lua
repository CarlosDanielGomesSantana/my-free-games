function love.load()
    WIDTH, HEIGHT = love.graphics.getDimensions()
    WHITE_COLOR = {1, 1, 1}
    DIVISOR = 20
end

function love.draw()
    love.graphics.setColor(WHITE_COLOR)

    for i = 0, WIDTH, 20 do
        love.graphics.line(
            i,     -- The position of first point on the x-axis.
            0,     -- The position of first point on the y-axis.
            i,     -- The position of second point on the x-axis.
            HEIGHT -- The position of second point on the y-axis.
        )
        love.graphics.line(
            0,     -- The position of first point on the x-axis.
            i,     -- The position of first point on the y-axis.
            WIDTH, -- The position of second point on the x-axis.
            i      -- The position of second point on the y-axis.
        )
    end

end
