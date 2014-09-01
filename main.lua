require "circle"

function love.load()
  clock = Circle:new(400, 300, 75)
end

function love.update(dt)
  clock:update(dt)
end

function love.draw()
  clock:draw()
end

