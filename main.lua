require "enemy.lua"

enemies = {}

function love.load()
  enemies[0] = Enemy(400, 0, love.graphics.newImage("chicken.png"))

  music = love.audio.newSource("02 - Let It Die.mp3") -- if "static" is omitted, LÖVE will stream the file from disk, good for longer music tracks
  local f = love.graphics.newFont(12)
  love.audio.play(music)
  love.graphics.setFont(f)
  love.graphics.setBackgroundColor(255,255,255)
end

function love.draw()
  for i, enemy in pairs(enemies) do
    love.graphics.draw(enemy["image"], enemy["x"], enemy["y"])
  end
end

function love.update(dt)
    mouseX, mouseY = love.mouse.getPosition()
    print("mouseX: " .. mouseX)
    print("mouseY: " .. mouseY)
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
