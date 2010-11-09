require "enemy.lua"

enemies = {}
assets = {}
MAXFPS = 30

lastEnemy = 0
enemiesAt = 3

function love.load()
	math.randomseed( os.time() )

  loadEnemyAssets(assets)

  music = love.audio.newSource("02 - Let It Die.mp3") -- if "static" is omitted, LÖVE will stream the file from disk, good for longer music tracks
  local f = love.graphics.newFont(12)
  love.audio.play(music)
  love.graphics.setFont(f)
  love.graphics.setBackgroundColor(255,255,255)
end

function love.draw()
  for i, enemy in pairs(enemies) do
    love.graphics.draw(enemy["image"], math.floor(enemy["x"]), math.floor(enemy["y"]))
  end
end

function love.update(dt)
  local ms = (1000 / MAXFPS) - (dt * 1000)
  if ms > 0 then
    love.timer.sleep(ms)
  end
  mouseX, mouseY = love.mouse.getPosition()

  -- update all the enemies
  for i, enemy in pairs(enemies) do
    updateEnemy(enemy, ms)

    if enemy.y > love.graphics.getHeight() then
      table.remove(enemies, i)
    end
  end

  -- see if we add a new enemy yet
  now = os.time()
  if now > lastEnemy + enemiesAt and math.random(100) < 50 then
    table.insert(enemies, Enemy())
    lastEnemy = now
  end
end

function love.mousepressed(x, y, button)
  if button == 'l' then
    imgx = x -- move image to where mouse clicked
    imgy = y
  end
  love.graphics.draw(image, imgx, imgy)
end

function love.mousereleased(x, y, button)
  if button == 'l' then
    print("hello")
  end
end

function love.keypressed(key, unicode)
  if key == 'b' then
    print("b pressed")
  elseif key == 'a' then
    print("a pressed")
  end
end

function love.keyreleased(key, unicode)
  if key == 'b' then
    print("b released")
  elseif key == 'a' then
    print("a released")
  end
end
