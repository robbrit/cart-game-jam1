require "explosions.lua"
require "enemy.lua"

enemies = {}
assets = {}
MAXFPS = 30

lastEnemy = 0
enemiesAt = 3

function explosion(x, y)
    image = love.graphics.newImage("part1.jpg") 
    buffer = 20
    A = love.graphics.newParticleSystem( image, buffer)
    A:setSpin(1, 2, 0.5)
    A:setPosition(x, y)
    A:setLifetime(3)
    --[[love.graphics.draw(A, x, y)]]--
    print("exploding")
end


function love.load()
	math.randomseed( os.time() )

  assets["chicken"] = love.graphics.newImage("chicken.png")

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

  -- this is to know where to insert the enemy in the enemies table
  lastI = 0

  for i, enemy in pairs(enemies) do
    updateEnemy(enemy, ms)

    if enemy.y > love.graphics.getHeight() then
      table.remove(enemies, i)
    end
    lastI = i
  end

  -- see if we add a new enemy yet
  now = os.time()
  if now > lastEnemy + enemiesAt and math.random(100) < 50 then
    table.insert(enemies, lastI + 1, Enemy(assets["chicken"]))
    lastEnemy = now
  end
end

function love.mousepressed(x, y, button)
   if button == 'l' then
      imgx = x -- move image to where mouse clicked
      imgy = y
   end
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
       
   explosion(50, 50)
      print("b released")
   elseif key == 'a' then
      print("a released")
   end
end
