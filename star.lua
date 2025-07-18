local score = require("score")

local star = {}

star.x = 0
star.y = 0
star.normalSpeed = 300
star.speed = 0
star.scale = 0.06

function star.load()
    star.image = love.graphics.newImage("assets/star.png")
    star.reset()
    star.resetSpeed()
end

function star.getWidth()
    return star.image:getWidth() * star.scale
end

function star.getHeight()
    return star.image:getHeight() * star.scale
end

function star.reset()
    star.x = math.random(0, love.graphics.getWidth())
    star.y = -star.getHeight() / 2
end

function star.resetSpeed()
    star.speed = star.normalSpeed
end

function star.increaseSpeed()
    star.speed = star.speed + 100
end

function star.checkCollision(x, y, width, height)
    return star.x < x + width and
           star.x + star.getWidth() / 2 > x and
           star.y < y + height and
           star.y + star.getHeight() / 2 > y
end

function star.update(dt)
    star.y = star.y + star.speed * dt
    if star.y > love.graphics.getHeight() + star.getHeight() / 2 then
        star.reset()
        star.resetSpeed()
        score.reset()
    end
end

function star.draw()
    local ox = star.image:getWidth() / 2
    local oy = star.image:getHeight() / 2
    love.graphics.draw(star.image, star.x, star.y, 0, star.scale, star.scale, ox, oy)
end

return star