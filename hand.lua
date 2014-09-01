Hand = {}

--Constructor
function Hand:new(x, y, radius, rate) --rate: time in s for hand to make it around the circle
  self.__index = self
  local hand = {}
  setmetatable(hand, Hand)

  hand.debug = false
  hand.createdTime = love.timer.getTime()

  hand.center = {
    x = x,
    y = y
  }

  hand.x = x
  hand.y = y
  hand.radius = radius

  --Coordinates aren't Cortesian... remember
  hand.rate = 2 * math.pi / rate
  hand.angle = math.pi / -2

  return hand
end

--Love callbacks
function Hand:update(dt)
  if self.debug then
    print(love.timer.getTime() - self.createdTime)
  end

  self:move(dt)
end

function Hand:draw()
  if self.debug then
    love.graphics.setColor(0, 255, 0)
    love.graphics.rectangle("fill", self.x - 5, self.y - 5, 10, 10)
  end
end

function Hand:move(dt)
  self.x = self.center.x + math.cos(self.angle) * self.radius
  self.y = self.center.y + math.sin(self.angle) * self.radius

  self.angle = self.angle + self.rate * dt
end
