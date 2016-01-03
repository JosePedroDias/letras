local foreach = function (func, list)
    for _, val in ipairs(list) do
        func(val)
    end
end

local dir = function (t)
    for k, v in pairs(t) do
        print(k, type(v), v)
    end
end

return {
    foreach = foreach,
    dir = dir
}
