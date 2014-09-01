Dot = {}

--Constructor
function Dot:new(x, y)
  self.__index = self
  local dot = {}
  setmetatable(dot, Dot)

  dot.created = love.timer.getTime()

  dot.x = x
  dot.y = y
  dot.radius = 3
  dot.scale = 1

  dot.color = {30, 30, 30}

  return dot
end

--Love callbacks
function Dot:update(dt)

end

function Dot:draw()
  love.graphics.setColor(self.color)
  love.graphics.circle("fill", self.x, self.y, self.radius * self.scale, 100)
end
