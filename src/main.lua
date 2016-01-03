require 'love'
require 'love.graphics'
require 'love.audio'

local u = require 'utils'

--local lettersImg
local correctSnd

local f = 1
local nPos = 0
local positions = {}
local screen = require 'screen'
local canvas

function love.load()
    love.window.setTitle('letras')

    --lettersImg = love.graphics.newImage('images/letters.jpg')
    --correctSnd = love.audio.newSource('sounds/correct.ogg', 'static')

    --image = love.graphics.newImage("cake.jpg")
    love.graphics.setNewFont(12)
    love.graphics.setBackgroundColor(64, 0, 64)

    print('screen', screen)
    --u.dir(screen)
    canvas = screen.setSize(256, 256)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'space' then
        --correctSnd:play()
    end
end

--function love.update(dt)
--end

function love.draw()
    --love.graphics.draw(lettersImg, 0, 0)

    love.graphics.setCanvas(canvas)
        love.graphics.setColor(64, 64, 64, 255)
        love.graphics.circle('fill', 128, 128, 128, 24)

        love.graphics.setColor(255, 255, 255)
        love.graphics.print(screen.stats(), 0, 0)
    love.graphics.setCanvas()

    screen.draw()
end


function queueUpTo10(x, y)
    x, y = screen.coords(x, y)
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

function love.touchpressed(_, x, y)
    queueUpTo10(x, y)
end

function love.touchmoved(_, x, y)
    queueUpTo10(x, y)
end
