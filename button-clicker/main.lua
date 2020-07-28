function love.load()
    button = {}
    button.x = 200
    button.y = 200
    button.size = 50

    score = 0
    timer = 0

    myFont = love.graphics.newFont(42)
end

-- game loop
function love.update(dt)

end

function love.draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", button.x, button.y, button.size)

    love.graphics.setFont(myFont)
    love.graphics.setColor(1,1,1)
    love.graphics.print(score)
end

function love.mousepressed(x, y, b, istouch)
    if b == 1 then
        if pointDistance(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
            score = score + 1
            button.x = math.random(button.size, love.graphics.getWidth() - button.size)
            button.y = math.random(button.size, love.graphics.getHeight() - button.size)
        end
    end
end

function pointDistance(x1, y1, x2, y2)
    return math.sqrt(((y2 - y1) ^ 2) + ((x2 - x1) ^ 2))
end