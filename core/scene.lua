--
-- gerenciador de cenas do game
--

Scene = {}

function Scene:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    self.__focus = ""
    self.__scenes = {}
    return obj
end

function Scene:add(name, scene)
    self.__scenes[name] = scene
    self.__scenes[name]:load()
end

function Scene:change(name)
    assert(self.__scenes[name], "scene precisa existir para fazer troca: " .. name)
    self.__focus = name
end

function Scene:get(name)
    name = name or self.__focus
    return self.__scenes[name]
end

return Scene