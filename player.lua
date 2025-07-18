local player = {}

player.x = 0
player.y = 0
player.scale = 0.2
player.speed = 1000
player.mirrored = 1

function player.load()
    player.image = love.graphics.newImage("assets/player.png")
    player.reset()
end

function player.getWidth()
    return player.image:getWidth() * player.scale
end

function player.getHeight()
    return player.image:getHeight() * player.scale
end

function player.reset()
    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() - player.getHeight() / 2 - 10
end

function player.update(dt)
    if love.keyboard.isDown("right") and player.x <= love.graphics.getWidth() then
        player.x = player.x + player.speed * dt
        player.mirrored = -1
    elseif love.keyboard.isDown("left") and player.x >= 0 then
        player.x = player.x - player.speed * dt
        player.mirrored = 1
    end
end

function player.draw()
    local ox = player.image:getWidth() / 2
    local oy = player.image:getHeight() / 2
    love.graphics.draw(player.image, player.x, player.y, 0, player.scale * player.mirrored, player.scale, ox, oy)
end

return player