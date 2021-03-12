require('src/models/ball')

--Set la vitesse et la position de la balle par rapport a la racket
function Ball:initializeBall(racketHeight, racketY)
  self.width, self.height = racketHeight * 0.5, racketHeight * 0.5  -- Taille
  
  self.scalewidth = self.width / self.skin:getWidth() --scale factor x
  self.scaleheight = self.height / self.skin:getHeight() --scale factor y
  
  self:resetBall(racketY)
end


--Reset la balle a sa position initiale
function Ball:resetBall(racketY)
  self.speedY = - (love.graphics.getPixelHeight() / 2) -- Vitesse verticale
  self.speedX = math.random(-(love.graphics.getPixelWidth() / 3), (love.graphics.getPixelHeight() / 2)) -- Vitesse horizontale
  self.x = love.graphics.getPixelWidth() / 2 - self.width / 2 -- Position en abscisse
  self.y = racketY - 2 * self.height - self.height / 2 -- Position en ordonnée
end

--Sert a definir le mouvement et la trajectoire de la balle
function Ball:MovmentBall(dt, racket)
  self.x = self.x + self.speedX * dt -- Mise à jour position en abscisse de la balle
  self.y = self.y + self.speedY * dt -- Mise à jour position en ordonnée de la balle
  --collisions avec les bordures
  if self.x + self.width >= ( love.graphics.getPixelWidth() * (7/10) ) then  -- Bordure droite
    self.speedX = -self.speedX
  elseif self.x <= ( love.graphics.getPixelWidth() * (3/10) ) then -- Bordure gauche
    self.speedX = -self.speedX
  end
  if self.y <= (love.graphics.getPixelHeight() * (1/10)) then  -- Bordure haut
    self.speedY = -self.speedY
  elseif self.y + self.height >= love.graphics.getPixelHeight( ) then -- Bordure bas
    lives.count = lives.count - 1 
    self:resetBall(racket:returnY()) 
    racket:resetRacket()
  end
end

--Cree la collision entre la racket et la ball, joue un son
function Ball:collisionBallWithRacket(racket, sourcesound)
    -- Collision par la gauche (coin haut inclus)
    if self.x < racket.x + 2/8 * racket.width and self.speedX >= 0 then
      if self.speedX <= (love.graphics.getPixelWidth() / 3) / 2 then -- Si vitesse trop faible
        self.speedX = math.random(0.75 * (love.graphics.getPixelWidth() / 3), (love.graphics.getPixelWidth() / 3)) -- Nouvelle vitesse
      else
        self.speedX = -self.speedX
      end
    -- Collision par la droite (coin haut inclus)
    elseif self.x > racket.x + 6/8 * racket.width and self.speedX <= 0 then
      if self.speedX >= -(love.graphics.getPixelWidth() / 3) / 2 then  -- Si vitesse trop faible
        self.speedX = -math.random(0.75 * (love.graphics.getPixelWidth() / 3), (love.graphics.getPixelWidth() / 3)) -- Nouvelle vitesse
      else 
        self.speedX = -self.speedX
      end
    end
    -- Collision par le haut
    if self.y - self.width < racket.y and self.speedY > 0 then
      self.speedY = -self.speedY
  end
  
  love.audio.play(sourcesound)
end

--Cree la collision entre le tableau de briques et la ball
function Ball:collisionBallWithBrickTab(Tab, sourcesound1, sourcesound2)
  --Parcourt le tableau
  for i = 1, #Tab do
    for j = 1, #Tab[i] do
      
      --partout ou il y a une brique
      if Tab[i][j] ~= 0 then 
        
        --si la brique n'est pas brisee, et qu'elle est touchee par la balle
        if Tab[i][j]:getBroken() == false and collideRect(self, Tab[i][j]) then
          
          self:collisionBallWithBrick(Tab[i][j]) --applique la collision entre la balle et la brique
          Tab[i][j]:decreaseResistance() --abime la brique
          love.audio.play(sourcesound1) --joue le son d'une brique touchee
          
          --si le brique casse
          if Tab[i][j]:getBroken() then 
            love.audio.play(sourcesound2) --joue le son d'une brique qui se brise
            return true, Tab[i][j]
          end
          
        end
        
      end
      
    end
  end
end

--Cree la collision entre la brick et la ball
function Ball:collisionBallWithBrick(brick)
  -- Collision par la gauche (coin haut inclus)
    if self.x < (brick.x + 3/8 * brick.width + self.width) and self.speedX >= 0 then 
      self.speedX = -self.speedX
    end
    -- Collision par la droite (coin haut inclus)
    if self.x > (brick.x + 5/8 * brick.width - self.width) and self.speedX <= 0 then
        self.speedX = -self.speedX
    end
    -- Collision par le haut
    if self.y < (brick.y - self.height) and self.speedY > 0 then
      self.speedY = -self.speedY
    end
    -- Collision par le bas
    if self.y + self.height > (brick.y + self.height) and self.speedY < 0 then
      self.speedY = -self.speedY
    end
    return true
end
