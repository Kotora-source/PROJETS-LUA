require('src/models/racket')

-----------------------------------------------------------------------------------------
--METHODES
--mouvement de la racket
function Racket:Movment(dt)
   -- Mouvement vers la gauche
  if love.keyboard.isDown('left', 'q') and self.x > ( love.graphics.getPixelWidth() * (3/10) ) then
      self.x = self.x - (self.speedX*dt)
  -- Mouvement vers la droite
  elseif love.keyboard.isDown('right', 'd') and self.x + self.width < ( love.graphics.getPixelWidth() * (7/10) ) then
      self.x = self.x + (self.speedX*dt)
  end
end

--reset la racket
function Racket:resetRacket()
  self.x = (love.graphics.getPixelWidth() - self.width) / 2 -- Position en abscisse
  self.y = love.graphics.getPixelHeight() - 64 -- Position en ordonnée
end

function Racket:actualizeposition()
  self.x = (love.graphics.getPixelWidth() - self.width) / 2 -- Position en abscisse
  self.y = love.graphics.getPixelHeight( ) - 64 -- Position en ordonnée
end

