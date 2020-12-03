--Classe de la balle -> classe objet

--Attributs de Ball
Ball = {
  name = '', --va servir pour les skins
  width = 0,
  heigth = 0,
  x = 0,
  y = 0,
  speedX = 0,
  speedY = 0
}

-----------------------------------------------------------------------------------------
--Constructeur
  --Mettre nil pdt la creation de l'objet
function Ball:new(o)
  o = o or {}
  setmetatable(o, self) --lie les deux tables
  self.__index = self
  --Initialisation des attributs de Ball
  name = 'default'
  width = 0
  height = 0
  x = 0
  y = 0
  speedX = 0
  speedY = 0
  return o
end

-----------------------------------------------------------------------------------------
--GETTERS
function Ball:getName()
  return self.name
end

function Ball:getWidth()
  return self.width
end

function Ball:getHeight()
  return self.height
end

function Ball:getX()
  return self.x
end

function Ball:getY()
  return self.y
end

function Ball:getSpeedX()
  return self.speedX
end

function Ball:getSpeedY()
  return self.speedY
end

-----------------------------------------------------------------------------------------
--METHODES

--Set la vitesse et la position de la balle par rapport a la racket
function Ball:initializeBall(racketHeight, racketY)
  self.width, self.height = racketHeight * 0.5, racketHeight * 0.5  -- Taille
  self:resetBall(racketY)
end


--Reset la balle a sa position initiale
function Ball:resetBall(racketY)
  self.speedY = -DEFAULT_SPEED_BY -- Vitesse verticale
  self.speedX = math.random(-DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Vitesse horizontale
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
  elseif self.x - self.width <= ( love.graphics.getPixelWidth() * (3/10) ) then -- Bordure gauche
    self.speedX = -self.speedX
  end
  if self.y <= 0 then  -- Bordure haut
    self.speedY = -self.speedY
  elseif self.y + self.height >= love.graphics.getPixelHeight( ) then -- Bordure bas
    lives.count = lives.count - 1 
    self:resetBall(racket:returnY()) 
    racket:resetRacket()
  end
end

--Dessine la balle
function Ball:drawBall()
  love.graphics.setColor(1, 1, 1)
  love.graphics.circle('fill', self.x, self.y, self.width) -- Rectangle
end

--Cree la collision entre la racket et la ball, joue un son
function Ball:collisionBallWithRacket(racket, sourcesound)
    -- Collision par la gauche (coin haut inclus)
    if self.x < racket.x + 2/8 * racket.width and self.speedX >= 0 then
      if self.speedX <= DEFAULT_SPEED_BX/2 then -- Si vitesse trop faible
        self.speedX = math.random(0.75*DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Nouvelle vitesse
      else
        self.speedX = -self.speedX
      end
    -- Collision par la droite (coin haut inclus)
    elseif self.x > racket.x + 6/8 * racket.width and self.speedX <= 0 then
      if self.speedX >= -DEFAULT_SPEED_BX/2 then  -- Si vitesse trop faible
        self.speedX = -math.random(0.75*DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Nouvelle vitesse
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
function Ball:collisionBallWithBrickTab(Tab, sourcesound)
  --Parcourt le tableau
  for i = 1, #Tab do
    for j = 1, #Tab[i] do
      --partout ou il y a une brique
      if Tab[i][j] ~= 0 then 
        --si la briques n'est pas brisee
        if Tab[i][j]:getBroken() == false and collideRect(self, Tab[i][j]) then
          self:collisionBallWithBrick(Tab[i][j])
          love.audio.play(sourcesound)
        end
      end
    end
  end
end

--Cree la collision entre la brick et la ball
function Ball:collisionBallWithBrick(brick)
  -- Collision par la gauche (coin haut inclus)
    if self.x < brick.x + 3/8 * brick.width and self.speedX >= 0 then 
      self.speedX = -self.speedX
    end
    -- Collision par la droite (coin haut inclus)
    if self.x > brick.x + 5/8 * brick.width and self.speedX <= 0 then
        self.speedX = -self.speedX
    end
    -- Collision par le haut
    if self.y < brick.y and self.speedY > 0 then
      self.speedY = -self.speedY
    end
    -- Collision par le bas
    if self.y > brick.y and self.speedY < 0 then
      self.speedY = -self.speedY
    end
  -- Brique maintenant cassée
  brick:setBroken() 
end

