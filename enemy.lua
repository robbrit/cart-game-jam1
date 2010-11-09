function Enemy(image)
  local stuff = {}
  stuff.image = image

  -- put me at a random location
  angle = math.random(360)

  radius = 400
  speed = 0.2

  stuff.x = math.cos(angle * math.pi / 180) * radius
  stuff.y = math.sin(angle * math.pi / 180) * radius

  -- move it towards the centre
  stuff.vx = (love.graphics.getWidth() / 2 - stuff.x) / radius * speed
  stuff.vy = (love.graphics.getHeight() / 2 - stuff.y) / radius * speed

  return stuff
end

function updateEnemy(enemy, dt)
  enemy.x = enemy.x + enemy.vx * dt
  enemy.y = enemy.y + enemy.vy * dt
end
