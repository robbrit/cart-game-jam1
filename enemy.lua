enemyTypes = {
}
NUM_ENEMY_TYPES = 3

function loadEnemyAssets(assets)
  -- main assets
  assets["chicken"] = love.graphics.newImage("chicken.png")
  assets["octopus"] = love.graphics.newImage("octopus.jpg")
  assets["antoine"] = love.graphics.newImage("antoine.jpeg")

  enemyTypes[0] = {
    image = assets["chicken"],
    speed = 0.05
  }

  enemyTypes[1] = {
    image = assets["octopus"],
    speed = 0.06,
    lastBlob = 0,
    blobTime = 5,
    update = function(me)
      now = os.time()
      if now > me.lastBlob + me.blobTime and math.random(100) < 10 then
        -- shoot a blob of ink
        addEnemy(Projectile(assets["ink"], 0.15, me.x + me.image:getWidth() / 2, me.y + me.image:getHeight()))
        me.lastBlob = now
      end
    end
  }

  enemyTypes[2] = {
    image = assets["antoine"],
    speed = 0.05
  }

  -- other assets
  assets["ink"] = love.graphics.newImage("ink.jpg")
end

function randomEnemy()
  elem = math.random(0, NUM_ENEMY_TYPES - 1)
  return enemyTypes[elem]
end

function Projectile(image, speed, x, y)
  local stuff = {}
  stuff.image = image
  stuff.vx = 0
  stuff.vy = speed
  stuff.x = x
  stuff.y = y
  return stuff
end

function Enemy()
  local stuff = {}

  enemy = randomEnemy()

  for k,v in pairs(enemy) do
    stuff[k] = v
  end

  -- put me at a random location
  stuff.x = math.random(love.graphics.getWidth() - stuff.image:getWidth())
  stuff.y = -stuff.image:getHeight()

  -- move it towards the centre
  stuff.vx = 0
  stuff.vy = stuff.speed

  return stuff
end

function updateEnemy(enemy, dt)
  enemy.x = enemy.x + enemy.vx * dt
  enemy.y = enemy.y + enemy.vy * dt

  if enemy.update ~= nil then
    enemy.update(enemy)
  end
end
