GameOverScene = {}

function GameOverScene:new(manager)
    assert(manager, "scene manager nao pode ser nil")
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    self.scene = manager
    return obj
end

-- metodos principais

function GameOverScene:load()
    self:__config_font()
    self:__config_keys()
end

function GameOverScene:draw()
    love.graphics.setBackgroundColor(255, 255, 255, 1)
    local text = 'Game Over'
    local posX = love.graphics.getWidth() / 2 - self.font:getWidth(text) / 2
    local posY = love.graphics.getHeight() / 2 - self.font:getHeight() / 2
    love.graphics.print(text, posX, posY)
end

function GameOverScene:keypressed(key, scancode, isrepeat)
    local handler = self.keys[key]
    if handler then
        handler()
    end
end

-- helpers

function GameOverScene:__config_font()
    self.font = love.graphics.newFont(30)
end

function GameOverScene:__config_keys()
    self.keys = {}
    self.keys['return'] = function()
        self.scene:change('menu')
    end
end

return GameOverScene