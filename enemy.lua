enemyTypes = {
}
NUM_ENEMY_TYPES = 2

function loadEnemyAssets(assets)
  assets["chicken"] = love.graphics.newImage("chicken.png")
  assets["octopus"] = love.graphics.newImage("octopus.jpg")

  enemyTypes[0] = {
    image = assets["chicken"],
    speed = 0.05
  }

  enemyTypes[1] = {
    image = assets["octopus"],
    speed = 0.06
  }
end

function randomEnemy()
  elem = math.random(0, NUM_ENEMY_TYPES - 1)
  return enemyTypes[elem]
end

function Enemy()
  local stuff = {}

  enemy = randomEnemy()

  stuff.image = enemy["image"]
  stuff.speed = enemy["speed"]

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
end
