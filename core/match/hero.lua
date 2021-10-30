Hero = {}

function Hero:new(values)
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    self.nick = values.nick or ""
    self.life = values.life or 100
    self.force = values.force or 20
    self.r = 0
    return obj
end

-- metodos principais

function Hero:attack(enemy)
    enemy:bleed(self.force)
end

function Hero:bleed(force)
    self.life = self.life - force
end

-- metodos para o love



return Hero