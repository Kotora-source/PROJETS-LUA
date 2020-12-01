--Classe de la racket -> classe objet

--Definition des attributs d'une racket
Racket = {
    speedX = 0, --Vitesse horizontale sur l'axe X de la raquette
    width = 0, --Largeur de la raquette
    height = 0, --hauteur de la raquette
    x = 0, --position X
    y = 0 --position Y
  }

-----------------------------------------------------------------------------------------
--Constructeur
    --mettre (nil) pdt la creation de l'objet
function Racket:new(o) 
  o = o  or {}
  setmetatable(o, self) --lie les deux tables
  self.__index = self
  --Initialisation des attributs de Racket
  self.speedX = (love.graphics.getPixelWidth() / 5) -- Vitesse horizontale a revoir
  self.width = ( love.graphics.getPixelWidth() * (4/10) ) / 4 -- Largeur
  self.height = math.abs( math.ceil( ( (love.graphics.getPixelWidth() * (4/10)) ) * 2 / 100 ) ) -- Hauteur
  self.x = (love.graphics.getPixelWidth() - self.width) / 2 -- Position en abscisse
  self.y = love.graphics.getPixelHeight( ) - 64 -- Position en ordonnée
  return o
end
    
-----------------------------------------------------------------------------------------
--GETTERS
function Racket:returnX()
  return self.x
end

function Racket:returnY()
  return self.y
end

function Racket:getSpeedX()
  return self.speedX
end

function Racket:getWidth()
  return self.width
end

function Racket:getHeight()
  return self.height
end

-----------------------------------------------------------------------------------------
--METHODES
--fais bouger la racket vers la gauche ou la droite, a revoir.
function Racket:Movment(dt)
   -- Mouvement vers la gauche
  if love.keyboard.isDown('left', 'q') and self.x > ( love.graphics.getPixelWidth() * (3/10) ) then
      self.x = self.x - (self.speedX*dt)
  -- Mouvement vers la droite
  elseif love.keyboard.isDown('right', 'd') and self.x + self.width < ( love.graphics.getPixelWidth() * (7/10) ) then
      self.x = self.x + (self.speedX*dt)
  end
end

--affiche la racket dans la fenetre LÖVE2D, a revoir egalement
function Racket:Affichage()
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height) -- Rectangle
end

--deja modifiee mais pas top top hein
function Racket:resetRacket()
  self.x = (love.graphics.getPixelWidth() - self.width) / 2 -- Position en abscisse
  self.y = love.graphics.getPixelHeight() - 64 -- Position en ordonnée
end
