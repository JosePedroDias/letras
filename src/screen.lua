require 'love'
require 'love.graphics'

local w, h, W, H
local scale, x, y
local canvas

function getHighestResolution()
    local wi, hi, area = 640, 480, 0
    local modes = love.window.getFullscreenModes()
    for _, m in ipairs(modes) do
        local areaT = m.width * m.height
        if areaT > area then
            wi = m.width
            hi = m.height
            area = areaT
        end
    end
    return wi, hi
end

function setSize(_W, _H, _w, _h)
    w, h = _w, _h
    local ar = _w / _h

    W, H = _W, _H
    local AR = W / H
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
    canvas:setFilter('nearest')
end

function startDraw()
    love.graphics.setCanvas(canvas)
end

function endDraw()
    love.graphics.setCanvas()
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
    getHighestResolution = getHighestResolution,
    setSize = setSize,
    startDraw = startDraw,
    endDraw = endDraw,
    coords = coords,
    stats = stats
}
