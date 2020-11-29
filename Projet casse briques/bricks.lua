--Classe des briques -> classe objet

--Definition des attributs d'une brick
Brick = {
  broken = false, --Par defaut, une brick n'est pas brisee
  width = 0, --Largeur
  height = 0, --Hauteur
  x = 0, --Position x
  y = 0, --Position y
  damaged = 0 --Endommagement de la brick
}

--Constructeur de bricks
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
  self.damaged = 0 --compteur a 0 par defaut, il augmente selon le nbr de hits
  return o
end

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

function Brick:getDamaged()
  return self.damaged
end

--SETTERS
function Brick:setDamaged(value)
  self.damaged = value
  if self.damaged == 3 then --si la brique a ete touchee 3 fois, elle se brise
    self.broken = true
  end
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


-- TOUT EST A REVOIR ICI
--Je vais creer 3 a 5 motifs de dispositions de briques, donc ces fonctions vont degager
--plus je vais faire des imgs de briques (avec animations de brique qui s'abime et qui se brise)

function createBrick(line, column)

  -- Fonction pour créer une brique et l'initialiser en fonction de sa position dans le mur
  brick = Brick:new(nil)
  
  brick.isNotBroken = true -- Brique pas encore cassée
  brick.width = WIN_WIDTH / BRICKS_PER_LINE - 5 -- Largeur
  brick.height = WIN_HEIGHT / 35 -- Hauteur
  brick.x = 2.5 + (column-1) * (5+brick.width) -- Position en abscisse
  brick.y = line * (WIN_HEIGHT/35+2.5) -- Position en ordonnée
  return brick
  
end

function initializeBricks()
    --[[ok cette fonction est cheloue je crois sincèrement que je vais la refaire, pour faire des patterns de briques personnalisés,
    en plus le gars du tuto s'est pas fait chier je pige pas ses variables
    (a voir après avec les collisions). je vais la laisser pour le moment même si j'ai pas tout pigé mais bref
    --]]
    bricks = {} -- Initialisation variable pour les briques
    for line=1, BRICKS_PER_COLUMN do
      table.insert(bricks, {}) -- Ajout d'une ligne
      for column=1, BRICKS_PER_LINE do
        local brick = createBrick(line, column)
        table.insert(bricks[line], brick) -- Ajout d'une brique par colonne de la ligne
      end
    end

end

function drawBricks()
  for line=1, #bricks do -- Ligne
      for column=1, #bricks[line] do -- Colonne
        local brick = bricks[line][column]
        if brick.isNotBroken then -- Si la brique n'est pas cassée
          love.graphics.rectangle('fill', brick.x, brick.y, brick.width, brick.height) -- Rectangle
        end
      end
  end
end
