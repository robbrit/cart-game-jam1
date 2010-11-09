require "enemy.lua"

enemies = {}

function love.load()
  enemies[0] = Enemy(400, 0, love.graphics.newImage("chicken.png"))
end

function love.draw()
  for i, enemy in pairs(enemies) do
    love.graphics.draw(enemy["image"], enemy["x"], enemy["y"])
  end
end

