local Dificults = require('core.match.dificults')
local Hero = require('core.match.hero')
local Enemy = require('core.match.enemy')

Match = {}

function Match:new(values)
    assert(values.manager, "scene manager nao pode ser nil")
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    self.scene = values.manager
    self.level = values.level or 0
    self.points = values.points or 0
    self.dificult = values.dificult or Dificults.EASY
    self.hero = values.hero
    self.enemies = {}
    self.gameOverScene = values.gameOverScene or "gameover"
    self.timer = 0
    return obj
end

-- metodos principais

function Match:gameOver()
    self.scene:change(self.gameOverScene)
end

function Match:generateEnemies()
    for _ = 1, 10 do
        local x = math.floor(math.random(0.5, 1.5)) * 800
        local y = math.floor(math.random(0.5, 1.5)) * 600
        local enemy = Enemy:new {
            nick = 'Aranha',
            x = x,
            y = y,
        }
        enemy:load()
        table.insert(self.enemies, enemy)
    end
end

-- metodos para o love

function Match:load()
    if not self.hero then
        self.hero = Hero:new { nick = 'Heroi' }
    end
end

function Match:draw()
    print(math.floor(math.random(0.5, 1.5)) * 800)
    for _, enemy in ipairs(self.enemies) do
        enemy:draw()
    end
end

function Match:update(dt)
    self.timer = self.timer + dt
    if self.timer >= 3 then
        if #self.enemies == 0 then
            self:generateEnemies()
        end
        self.timer = 0
    end
end

return Match