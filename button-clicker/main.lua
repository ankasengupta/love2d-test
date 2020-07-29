--[[called once, at the beginning of the game]]
function love.load()
    button = {}
    button.x = 200
    button.y = 200
    button.size = 50

    score = 0
    timer = 10
    gameState = false -- true during game play, false during main menu

    myFont = love.graphics.newFont(42)
end

--[[game loop
    @param dt delta time]]
function love.update(dt)
    if gameState == true then
        if timer > 0 then
            timer = timer - dt
        end
        if timer < 0 then
            timer = 0
            gameState = false
            score = 0
        end
    end
end

--[[callback function used to draw on the screen every frame]]
function love.draw()
    if gameState == true then
        love.graphics.setColor(0, 0, 1)
        love.graphics.circle("fill", button.x, button.y, button.size)
    end

    love.graphics.setFont(myFont)
    love.graphics.setColor(1,1,1)
    love.graphics.print("Score : " .. score)
    love.graphics.print("Time : " .. math.ceil(timer), 250, 0)

    -- main menu
    if gameState == false then 
        love.graphics.printf("Click anywhere to begin!", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
    end
end

--[[callback function triggered when a mouse button is pressed
    @param x the x coordinate of the button
    @param y the y coordinate of the button
    @param b the button clicked by the user
    @istouch the screen touch by the user]]
function love.mousepressed(x, y, b, istouch)
    if b == 1 and gameState == true then
        if pointDistance(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
            score = score + 1
            button.x = math.random(button.size, love.graphics.getWidth() - button.size)
            button.y = math.random(button.size, love.graphics.getHeight() - button.size)
        end
    end

    if gameState == false then
        gameState = true
        timer = 10
    end
end

--[[to find the distance between two points
    @param x1 the x coordinate of the button
    @param x2 the y coordinate of the mouse click
    @param y1 the y coordinate of the button
    @param y2 the y coordinate of the mouse click
    @return the distance between the two points]]
function pointDistance(x1, y1, x2, y2)
    return math.sqrt(((y2 - y1) ^ 2) + ((x2 - x1) ^ 2))
end
