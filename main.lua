local player = require("player")
local star = require("star")
local score = require("score")

function love.load()
    winWidth, winHeight = love.graphics.getDimensions()
    screenWidth, screenHeight = love.window.getDesktopDimensions(1)
    x = (screenWidth - winWidth) / 2
    y = (screenHeight - winHeight) / 2
    love.window.setPosition(x, y)

    love.graphics.setBackgroundColor(78/255, 67/255, 224/255)

    music = love.audio.newSource("assets/music.mp3", "stream")
    music:setLooping(true)
    music:play()

    starSound = love.audio.newSource("assets/star.mp3", "static")
    
    player.load()
    star.load()
    score.load()
end

function love.update(dt)
    player.update(dt)
    star.update(dt)

    if star.checkCollision(player.x, player.y, player.getWidth() / 2, player.getHeight() / 2) then
        score.increaseScore()
        star.increaseSpeed()
        star.reset()
        starSound:stop()
        starSound:play()
    end
end

function love.draw()
    player.draw()
    star.draw()
    score.draw()
end