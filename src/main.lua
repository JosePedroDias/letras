require 'love'
require 'love.graphics'
require 'love.audio'

local screen = require 'screen'

--local u = require 'utils'

--local lettersImg

local correctSnd
local f = 1
local nPos = 0
local positions = {}

local G = love.graphics
local W, H = screen.getHighestResolution()
local w, h = 256, 256

function love.load()
    love.window.setTitle('letras')

    --lettersImg = love.graphics.newImage('images/letters.jpg')
    --correctSnd = love.audio.newSource('sounds/correct.ogg', 'static')

    --image = love.graphics.newImage("cake.jpg")
    G.setNewFont(12)
    G.setBackgroundColor(0, 0, 0)

    screen.setSize(W, H, w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'space' then
        --correctSnd:play()
    end
end

function love.update(dt)
    f = f + 1
end

function drawExtremes(x0, y0, x1, y1, r, g, b)
    G.setColor(r, g, b, 255)
    G.circle('fill', x0, y0, 8, 8)
    G.circle('fill', x1, y0, 8, 8)
    G.circle('fill', x0, y1, 8, 8)
    G.circle('fill', x1, y1, 8, 8)
end

function love.draw()
    G.clear(0, 0, 0, 0)

    --G.draw(lettersImg, 0, 0)

    drawExtremes(0, 0, W, H, 255, 0, 255)

    screen.startDraw()
        G.clear(0, 0, 0, 0)
        G.setColor(64, 64, 64, 255)
        G.circle('fill', 128, 128, 128, 24)

        drawExtremes(0, 0, w, h, 255, 255, 0)

        G.setColor(255, 255, 255)
        G.print(screen.stats(), 0, 0)
        G.print('F:' .. f, 0, 20)
    screen.endDraw()
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
