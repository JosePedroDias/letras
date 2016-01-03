local foreach = function (func, list)
    for _, val in ipairs(list) do
        func(val)
    end
end

local foreachi = function (func, list)
    for idx, val in ipairs(list) do
        func(val, idx)
    end
end

local dir = function (t)
    for k, v in pairs(t) do
        print(k, type(v), v)
    end
end

return {
    foreach = foreach,
    foreachi = foreachi,
    dir = dir
}
