function love.load()
   music = love.audio.newSource("02 - Let It Die.mp3") -- if "static" is omitted, LÖVE will stream the file from disk, good for longer music tracks
   local f = love.graphics.newFont(12)
   love.audio.play(music)
   love.graphics.setFont(f)
   love.graphics.setBackgroundColor(255,255,255)
   
end

function love.update(dt)

end

function love.draw()
   love.graphics.print("done", 10, 10)
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
