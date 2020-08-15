local GameObject = require("engine.object.GameObject")

local Tetromino = GameObject:new
{
    row = 0,
    column = 0,
    type = "I"
}

function Tetromino:new(column, row, type)
    local tetromino = {}

    setmetatable(tetromino, self)
    self.__index = self

    tetromino.column = math.floor(column) or self.column
    tetromino.row = math.floor(row) or self.row
    tetromino.type = type or self.type

    return tetromino
end

function Tetromino:shape()
    -- Refer to: https://en.wikipedia.org/wiki/Tetromino for tetromino names.
    local shapes =
    {
        ["I"] =
        {
            { column = 0, row = 3 },
            { column = 0, row = 2 },
            { column = 0, row = 1 },
            { column = 0, row = 0 },
        },
        ["J"] =
        {
            { column = 0,  row = 2 },
            { column = 0,  row = 1 },
            { column = 0,  row = 0 },
            { column = -1, row = 0 },
        },
        ["L"] =
        {
            { column = 0, row = 2 },
            { column = 0, row = 1 },
            { column = 0, row = 0 },
            { column = 1, row = 0 },
        },
        ["O"] =
        {
            { column = 0, row = 1 },
            { column = 1, row = 1 },
            { column = 0, row = 0 },
            { column = 1, row = 0 },
        },
        ["S"] =
        {
            { column = 1,  row = 1 },
            { column = 0,  row = 1 },
            { column = 0,  row = 0 },
            { column = -1, row = 0 },
        },
        ["Z"] =
        {
            { column = -1, row = 1 },
            { column = 0,  row = 1 },
            { column = 0,  row = 0 },
            { column = 1,  row = 0 },
        },
        ["T"] =
        {
            { column = 0,  row = 0 },
            { column = -1, row = 1 },
            { column = 0,  row = 1 },
            { column = 1,  row = 1 },
        },
    }

    return shapes[self.type]
end

function Tetromino:draw(game)
    local grid = game.objects.grid

    local shape = self:shape()

    for index, cell in pairs(shape)
    do
        love.graphics.rectangle(
            "fill",
            grid.x + (grid.cellDimension * (self.column + cell.column)),
            grid.y + (grid.cellDimension * (self.row - cell.row)),
            grid.cellDimension,
            grid.cellDimension)
    end
end

return Tetromino