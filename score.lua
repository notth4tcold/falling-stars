local score = {}
local titleText = {}

score.value = 0
score.resetValue = 0
score.maxScore = 0

function score.load()
    font = love.graphics.newFont("assets/MapleMono-Regular.ttf", 20)
    love.graphics.setFont(font)

    for line in love.filesystem.lines("assets/falling-starts.txt") do
        table.insert(titleText, line)
    end
    score.reset()
end

function score.reset()
    score.value = score.resetValue
end

function score.increaseScore()
    score.value = score.value + 1
    if score.value > score.maxScore then
        score.maxScore = score.value
    end
end

function score.draw()
    local windowWidth = love.graphics.getWidth()
    local y = 10

    love.graphics.setColor(1, 1, 1)

    love.graphics.print("Score: " ..score.value, 20, y)
    y = y + font:getHeight() + 2
    love.graphics.print("Max score: " ..score.maxScore, 20, y)

    y = 200
    for _, line in ipairs(titleText) do
        local textWidth = font:getWidth(line)
        local x = (windowWidth - textWidth) / 2
        love.graphics.print(line, x, y)
        y = y + font:getHeight() + 2
    end
end

return score