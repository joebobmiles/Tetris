local GameObject = require("engine.object.GameObject")

local Grid = GameObject:new()

function Grid:new()
    local grid = {}

    setmetatable(grid, self)
    self.__index = self

    return grid
end

function Grid:update(game, dt)
    return
end

function Grid:draw(game)
    love.graphics.rectangle("line", 0, 0, 10, 10)
end

return Grid