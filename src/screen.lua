require 'love'
require 'love.graphics'

local screen = {}

local w, h, ar
local W, H, AR = 10000, 10000, 1
local scale, x, y = 1, 0, 0
local canvas

function setSize(_w, _h)
    w, h, ar = _w, _h, _w / _h

    local modes = love.window.getFullscreenModes()
    for _, m in ipairs(modes) do
        --local ar = m.width / m.height
        print(m.width .. ' x ' .. m.height)
    end
    W, H = 800, 600 -- TODO
    AR = W / H
    if AR > ar then
        scale = H / h
        y = 0
        x = (W - w * scale) / 2
    else
        scale = W / w
        x = 0
        y = (H - h * scale) / 2
    end
    love.window.setMode(W, H, {fullscreen=true})

    canvas = love.graphics.newCanvas(w, h)
    --canvas:setFilter('nearest')

    return canvas
end

function draw()
    --https://love2d.org/wiki/love.graphics.draw
    love.graphics.draw(canvas, x, y, 0, scale, scale)
end

function coords(_x, _y)
    _x = (_x - x) / scale
    _y = (_y - y) / scale
    return _x, _y
end

function stats()
    return 'x:' .. x .. ', y:' .. y .. ', w:' .. w .. ', h:' .. h .. ', scale:' .. scale
end

return {
    setSize = setSize,
    draw = draw,
    coords = coords,
    stats = stats
}
