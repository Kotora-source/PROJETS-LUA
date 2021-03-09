require('src/models/racket')

--affichage de la racket
function Racket:Affichage()
  love.graphics.setColor(1, 1, 1)
  
  love.graphics.draw(self.img, self.x, self.y, 0, self.scalewidth, self.scaleheight)
end
