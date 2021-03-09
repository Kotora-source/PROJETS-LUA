--Definition des attributs d'une brick
Brick = {
  broken = false, --Par defaut, une brick est intacte
  width = 0, --Largeur
  height = 0, --Hauteur
  x = 0, --Position x
  y = 0, --Position y
  resistance = 0, --Resistance aux hits
  memoryresist = 0, --Memoire de la resistance
  color = '', --couleur de la brick
  scorevalue = 1 --valeur de la brique en termes de score
}

-----------------------------------------------------------------------------------------
--Constructeur
    --mettre (nil) pdt la creation de l'objet
function Brick:new(o) 
  o = o or {}
  setmetatable(o, self) --lie les deux tables
  self.__index = self
  --Initialisation des attributs de Brick
  self.broken = false --par defaut, la brique n'est pas brisee
  self.width = 0 --a voir vu que j'aimerai mettre des img a la place des briques.
  self.height = 0
  self.x = 0
  self.y = 0
  self.resistance = 0 --compteur a 0 par defaut, il augmente selon le nbr de hits
  self.memoryresist = 0 --garde en memoire la resistance de base de la brique
  self.color = 0 --provisoire, je mettrais bientot un placeholder.
  self.scorevalue = 1 --par defaut 1
  return o
end

-----------------------------------------------------------------------------------------
--GETTERS
function Brick:returnX()
  return self.x
end

function Brick:returnY()
  return self.y
end

function Brick:getBroken()
  return self.broken
end

function Brick:getWidth()
  return self.width
end

function Brick:getHeight()
  return self.height
end

function Brick:getResistance()
  return self.resistance
end

function Brick:getColorBrick()
  return self.color
end

function Brick:getScoreValue()
  return self.scorevalue
end

-----------------------------------------------------------------------------------------
--SETTERS
function Brick:decreaseResistance()
  self.resistance = self.resistance - 1
  if self.resistance <= 0 then --si la brique a ete touchee X fois, elle se brise
    self:setBroken()
  end
end

function Brick:setResistance(value)
  self.resistance = value
  self.memoryresist = value
end

function Brick:setWidth(value)
  self.width = value
end

function Brick:setHeight(value)
  self.height = value
end

function Brick:setX(value)
  self.x = value
end

function Brick:setY(value)
  self.y = value
end

function Brick:setBroken()
  self.broken = true
end

function Brick:Restore()
  self.broken = false
  self.resistance = self.memoryresist
end

function Brick:setColorBrick(color)
  self.color = color
end

function Brick:setScoreValue(value)
  self.scorevalue = value
end
