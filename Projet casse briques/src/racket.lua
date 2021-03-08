--Classe de la racket -> classe objet

--Definition des attributs d'une racket
Racket = {
    img = {}, --Image de la racket
    speedX = 0, --Vitesse horizontale sur l'axe X de la raquette
    width = 0, --Largeur de la raquette
    height = 0, --hauteur de la raquette
    scalewidth = 0, --Scale factor x
    scaleheight = 0, --scale factor y
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
  self.img = love.graphics.newImage(PATH_RACKET) --Image de la racket
  
  self.speedX = (love.graphics.getPixelWidth() / 2.5) -- Vitesse horizontale a revoir
  self.width = ( love.graphics.getPixelWidth() * (4/10) ) / 4 -- Largeur
  self.height = math.abs( math.ceil( ( (love.graphics.getPixelWidth() * (4/10)) ) * 2 / 100 ) ) -- Hauteur
  
  self.scalewidth = self.width / self.img:getWidth() --scale factor x
  self.scaleheight = self.height / self.img:getHeight() --scale factor y
  
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

--affichage de la racket
function Racket:Affichage()
  love.graphics.setColor(1, 1, 1)
  
  love.graphics.draw(self.img, self.x, self.y, 0, self.scalewidth, self.scaleheight)
end

--reset la racket
function Racket:resetRacket()
  self.x = (love.graphics.getPixelWidth() - self.width) / 2 -- Position en abscisse
  self.y = love.graphics.getPixelHeight() - 64 -- Position en ordonnée
end
