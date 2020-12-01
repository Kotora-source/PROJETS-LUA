--Classe des briques -> classe objet

--Definition des attributs d'une brick
Brick = {
  broken = false, --Par defaut, une brick est intacte
  width = 0, --Largeur
  height = 0, --Hauteur
  x = 0, --Position x
  y = 0, --Position y
  damaged = 0, --Endommagement de la brick
  color = ''
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
  self.damaged = 0 --compteur a 0 par defaut, il augmente selon le nbr de hits
  self.color = 0 --provisoire, je mettrais bientot un placeholder.
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

function Brick:getDamaged()
  return self.damaged
end

function Brick:getColorBrick()
  return self.color
end

-----------------------------------------------------------------------------------------
--SETTERS
function Brick:setDamaged(value)
  self.damaged = value
  if self.damaged == 3 then --si la brique a ete touchee 3 fois, elle se brise
    self:setBroken()
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

function Brick:Restore()
  self.broken = false
  self.damaged = 0
end

function Brick:setColorBrick(color)
  self.color = color
end

-----------------------------------------------------------------------------------------
--FONCTIONS QUI CREENT LES MOTIFS DE BRIQUES
    --0 = sans brique
    --1 = brique bleue : color (0.1, 0.3, 0.6)
    --2 = brique jaune : color (1, 1, 0)
    --3 = brique verte : color (0.1, 0.5, 0.1)
    --4 = brique orange : color (0.9, 0.5, 0)
    --5 = brique bleu clair : color (0.2, 0.5, 0.8)
    --6 = brique vert clair : color (0.5, 0.6, 0.1)
    --7 = brique rouge : color (0.7, 0, 0)
    --8 = brique blanche : color (1, 1, 1)
    --9 = brique COULEUR A DEFINIR : color (

--Fonction qui rempli le tableau // pas encore optimale
function createPattern(template) --@param template le tableau, return template
    
  nbrBricks = #template * #template[1]
  
  for i = 1, #template do --rempli le tableau de briques
    for j = 1, #template[i] do --les cles commencent a 1
      if template[i][j] ~= 0 then -- partout ou il y a un 1, ajoute une brique a la place
          --Cree une brick
          brick = Brick:new(nil)
          
          --Definition des attributs de Brick
          -- defini la hauteur et la largeur (pourcentage arrondi au supérieur en valeur absolue, occupe 4/10 de l'ecran)
          l = math.abs( math.ceil( ( (love.graphics.getPixelWidth() * (4/10)) - nbrBricks) * 5 / 100 ) )
          brick:setHeight( l ) 
          brick:setWidth( l )
          
          --defini l'abscisse (sur 1/3 de l'ecran) et l'ordonnee (en fonction du nbr de bricks), arrondis au superieur en valeur absolue
          brick:setX( math.abs( math.ceil( (love.graphics.getPixelWidth() * (3/10) ) + j * (5 + brick:getWidth()) ) ) ) 
          brick:setY( math.abs( math.ceil( i * (love.graphics.getPixelHeight() / nbrBricks + brick:getHeight()) + 5 ) ) ) 
          
          brick:setColorBrick(template[i][j]) --defini la couleur des briques 
          
          --Place la brick dans le tableau a la place de la valeur 1
          template[i][j] = brick
      end
    end
  end
  return template
end


--Cree un motif coeur de briques
function createHeartPattern()
  -- template coeur
  template = 
  { {0, 7, 7, 7, 0, 7, 7, 7, 0},
    {7, 7, 7, 7, 7, 7, 7, 7, 7},
    {7, 7, 7, 8, 7, 8, 7, 7, 7},
    {7, 7, 8, 8, 8, 8, 8, 7, 7},
    {0, 7, 7, 8, 8, 8, 7, 7, 0},
    {0, 0, 7, 7, 8, 7, 7, 0, 0},
    {0, 0, 0, 7, 7, 7, 0, 0, 0},
    {0, 0, 0, 0, 7, 0, 0, 0, 0}
  }
  
  template = createPattern(template)
  return template
end



--Cree un motif de fleur de briques
function createFlowerPattern()
  --voir img dans fichiers pour le modele de fleur d'hibiscus
  template = {
    {0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 1, 5, 5, 1, 1, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 5, 5, 5, 5, 5, 1, 2, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 5, 5, 5, 5, 5, 2, 2, 1, 1, 5, 5, 1, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 5, 5, 5, 1, 2, 2, 1, 5, 5, 5, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 1, 5, 1, 1, 2, 4, 1, 1, 5, 5, 1, 3, 3, 0, 0, 0},
    {0, 1, 1, 1, 1, 1, 1, 1, 4, 4, 1, 5, 5, 1, 3, 6, 6, 6, 6, 0},
    {1, 5, 5, 5, 5, 5, 1, 1, 4, 1, 1, 1, 1, 1, 1, 3, 3, 3, 6, 3},
    {1, 5, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 1, 1, 3, 6, 3},
    {1, 5, 5, 5, 5, 5, 1, 5, 1, 5, 1, 5, 5, 5, 5, 1, 3, 3, 0, 0},
    {1, 5, 5, 5, 1, 1, 5, 5, 1, 5, 1, 1, 5, 5, 5, 1, 0, 0, 0, 0},
    {1, 5, 5, 1, 1, 1, 5, 5, 5, 5, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
    {0, 1, 1, 1, 0, 1, 5, 5, 5, 5, 5, 1, 3, 3, 3, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 5, 5, 5, 5, 1, 1, 3, 3, 6, 3, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 3, 3, 6, 3, 6, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 6, 6, 6, 6, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0}
  }
  
  createPattern(template)
  return template
end

-- Cree un motif diamant de briques
function createDiamondPattern()
  template = {
    {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
    {0, 0, 1, 5, 5, 5, 1, 5, 5, 5, 1, 5, 5, 5, 1, 0 ,0},
    {0, 1, 5, 5, 5, 1, 5, 5, 5, 5, 5, 1, 5, 5, 5, 1, 0},
    {1, 5, 5, 5, 1, 5, 5, 5, 5, 5, 5, 5, 1, 5, 5, 5, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {0, 1, 5, 5, 1, 5, 5, 5, 5, 5, 5, 5, 1, 5, 5, 1, 0},
    {0, 0, 1, 5, 5, 1, 5, 5, 5, 5, 5, 1, 5, 5, 1, 0, 0},
    {0, 0, 0, 1, 5, 5, 1, 5, 5, 5, 1, 5, 5, 1, 0, 0, 0},
    {0, 0, 0, 0, 1, 5, 5, 1, 5, 1, 5, 5, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 5, 5, 1, 5, 5, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 1, 5, 5, 5, 1, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 1, 5, 1, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}
  }
  
  createPattern(template)
  return template
end



-----------------------------------------------------------------------------------------
--FONCTION QUI DESSINE LES BRIQUES

--Dessine l'image correspondante à l'id de l'image qu'on veut
function drawImgBrick(brick, imgId)
  --TEMPORAIRE : placeholders de couleurs
  if imgId == 1 then
    
    love.graphics.setColor(0.1, 0.3, 0.6)
    
  elseif imgId == 2 then
    
    love.graphics.setColor(1, 1, 0)
    
  elseif imgId == 3 then
    
    love.graphics.setColor(0.1, 0.5, 0.1)
    
  elseif imgId == 4 then
    
    love.graphics.setColor(0.9, 0.5, 0)
    
  elseif imgId == 5 then
    
    love.graphics.setColor(0.2, 0.5, 0.8)
    
  elseif imgId == 6 then
    
    love.graphics.setColor(0.5, 0.6, 0.1)
    
  elseif imgId == 7 then
    
    love.graphics.setColor(0.7, 0, 0)
    
  elseif imgId == 8 then
    
    love.graphics.setColor(1, 1, 1)
    
  elseif imgId == 9 then
    
    --love.graphics.setColor()
    
  end
  
  --Dessine la brique
  love.graphics.rectangle('fill', brick:returnX(), brick:returnY(), brick:getWidth(), brick:getHeight(), 5, 5)
  --Reset la couleur en noir
  love.graphics.setColor(1, 1, 1)
end


--Dessine le tableau de briques
function drawBricks(tab)
  --parcours le tableau de briques
  for i = 1, #tab do
    for j = 1, #tab[i] do
      --si la valeur n'est pas egale a 0
      if tab[i][j] ~= 0 then
        --recuperation des attributs de la brique en local
        local brick = tab[i][j]
        --verification que la brique n'est pas cassee
        if brick:getBroken() == false then
          --Dessine la brique en fonction de sa couleur
          drawImgBrick(brick, brick:getColorBrick())
        end
      end
    end
  end
end
