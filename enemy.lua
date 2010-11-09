function Enemy(image)
  local stuff = {}
  stuff.image = image

  speed = 0.05

  -- put me at a random location
  stuff.x = math.random(love.graphics.getWidth() - image:getWidth())
  stuff.y = -image:getHeight()

  -- move it towards the centre
  stuff.vx = 0
  stuff.vy = speed

  return stuff
end

function updateEnemy(enemy, dt)
  enemy.x = enemy.x + enemy.vx * dt
  enemy.y = enemy.y + enemy.vy * dt
end
