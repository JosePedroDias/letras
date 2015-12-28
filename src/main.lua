--local cv
--local W, H = 256, 512
--local SW, SH, dw, dh

require 'love'
require 'love.graphics'

local f = 1
local nPos = 0
local positions = {}

function love.load()
    love.window.setTitle('hello')

    --modes = love.window.getFullscreenModes()
    --for k, v in pairs(modes) do
    --  print(v.width, v.height)
    --end
    --SW = 800
    --SH = 600
    --love.window.setMode(SW, SH, {fullscreen=true})
    --dw = (SW - W) / 2
    --dh = (SH - H) / 2

    --image = love.graphics.newImage("cake.jpg")
    love.graphics.setNewFont(16)
    love.graphics.setBackgroundColor(64, 0, 64)

    --cv = love.graphics.newCanvas(W, H)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

--function love.update(dt)
--end

function love.draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Hello World " .. tostring(f), 10, 10)
    f = f + 1

    ----love.graphics.setCanvas(cv)
    --cv:renderTo(function()
    --  love.graphics.clear()
    --  love.graphics.setColor(255, 0, 255)
    --  love.graphics.circle('fill', f, 300, 50, 100) -- Draw purple circle with 100 segments
    --end)
    ----love.graphics.setCanvas()
    --love.graphics.draw(cv, dw, dh)

    --love.graphics.setColor(0, 255, 255)
    for i=1,nPos do
        love.graphics.setColor(0, 255, 255, 255*i/nPos)
        love.graphics.circle('fill', positions[i][1], positions[i][2], 10, 12) -- Draw purple circle with 100 segments
    end
end


function queueUpTo10(x, y)
    if nPos == 10 then
        table.remove(positions, 1)
        positions[10] = {x, y}
    else
        nPos = nPos + 1
        positions[nPos] = {x, y}
    end
end

function love.mousepressed(x, y)
    queueUpTo10(x, y)

end

function love.mousemoved(x, y)
    queueUpTo10(x, y)
end

function love.touchpressed(id, x, y)
    queueUpTo10(x, y)
end

function love.touchmoved(id, x, y)
    queueUpTo10(x, y)
end

--function love.config()

-- https://love2d.org/wiki/KeyConstant
--function love.keypressed(key)
--function love.keyreleased(key)

--function love.mousepressed(x, y, button)
--function love.mousemoved(x, y, dx, dy)
--function love.mousereleased(x, y, button)

--function love.touchpressed(id, x, y, pressure)
--love.touchmoved(id, x, y, pressure)
--function love.touchreleased(id, x, y, pressure)

--function love.focus(f)

--function love.quit()
