require "dot"
require "hand"

Circle = {}

--Constructor
function Circle:new(x, y, radius)
  self.__index = self
  local circle = {}
  setmetatable(circle, Circle)

  circle.dots = {}
  placeDots(circle.dots, x, y, radius)

  circle.minuteHand = Hand:new(x, y, radius, 60)
  --circle.minuteHand.debug = true

  circle.x = x
  circle.y = y
  circle.radius = radius

  return circle
end

--Helpers
function placeDots(dots, x, y, radius)
  local offset = 0

  for i = 1, 24 do
    dots[i] = Dot:new(x + math.cos(offset) * radius, y + math.sin(offset) * radius)

    offset = offset + math.pi / 12
  end
end

--Love callbacks
function Circle:update(dt)
  for i = 1, #self.dots do
    self:modDots(self.dots[i])
    self.dots[i]:update(dt)
  end

  self.minuteHand:update(dt)
end

function Circle:draw()
  for i = 1, #self.dots do
    self.dots[i]:draw()
  end

  self.minuteHand:draw()
end

--Class functions
function Circle:modDots(dot)
  local distance = math.sqrt((self.minuteHand.x - dot.x)^2 + (self.minuteHand.y - dot.y)^2)
  local theta = math.acos((2 * self.radius^2 - distance^2) / (2 * self.radius^2))

  if theta <= math.pi / 12 then
    dot.scale = 1 + 2*((-144 / math.pi^2) * theta^2 + 1)
    
    for i = 1, #dot.color do
      dot.color[i] = 30 + 120*((-144 / math.pi^2) * theta^2 + 1) 
    end
  end
end

