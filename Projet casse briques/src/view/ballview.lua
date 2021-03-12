require('src/models/ball')

--Dessine la balle
function Ball:drawBall()
  love.graphics.setColor(1, 1, 1)
  
  love.graphics.draw(self.skin, self.x, self.y, 0, self.scalewidth, self.scaleheight)
end