﻿--Classe de la racket -> classe objet

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
  self.speedX = 215 -- Vitesse horizontale
  self.width = WIN_WIDTH / 4 -- Largeur
  self.height = WIN_HEIGHT / 37 -- Hauteur
  self.x = (WIN_WIDTH-self.width) / 2 -- Position en abscisse
  self.y = WIN_HEIGHT - 64 -- Position en ordonnée
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
  if love.keyboard.isDown('left', 'q') and self.x > 0 then
      self.x = self.x - (self.speedX*dt)
  -- Mouvement vers la droite
  elseif love.keyboard.isDown('right', 'd') and self.x + self.width < WIN_WIDTH then
      self.x = self.x + (self.speedX*dt)
  end
end

--affiche la racket dans la fenetre LÖVE2D, a revoir egalement
function Racket:Affichage()
  love.graphics.setColor(255, 255, 255) -- Couleur blanche, a modifer plus tard
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height) -- Rectangle
end
