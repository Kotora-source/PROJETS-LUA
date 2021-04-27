--Attributs de Ball
Ball = {
  name = '', --va servir pour les skins
  skin = {},
  width = 0,
  heigth = 0,
  x = 0,
  y = 0,
  speedX = 0,
  speedY = 0,
  scalewidth = 0,
  scaleheight = 0,
  impact = 0
}

-----------------------------------------------------------------------------------------
--Constructeur de base
  --Mettre nil pdt la creation de l'objet
function Ball:new(o)
  o = o or {}
  setmetatable(o, self) --lie les deux tables
  self.__index = self
  --Initialisation des attributs de Ball
  self.name = 'default'
  self.skin = love.graphics.newImage(PATH_BALL) --Image de la racket
  self.width = 0
  self.height = 0
  self.x = 0
  self.y = 0
  self.speedX = 0
  self.speedY = 0
  self.impact = 0
  return o
end

--[[faire un constructeur de balles avec d'autres spécificités
genre faire un tableau pour pouvoir stocker les noms de PATH dynamiquement et pas se 
casser le cul à faire un if else chiant là
et créer des balles avec des effets ptet, des skins difs, une force d'impact plus mieux que celle
de base, des balles qui se divisent en plusieurs jsp fais travailler ton imagination
]]--
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
