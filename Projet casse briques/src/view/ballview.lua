require('src/models/ball')

--Dessine la balle
function Ball:drawBall()
  love.graphics.setColor(0, 0, 0)
  love.graphics.circle('fill', self.x, self.y, self.width) -- Rectangle
end