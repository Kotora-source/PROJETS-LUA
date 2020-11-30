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

--Fonction qui rempli le tableau
function createPattern(template) --@param template le tableau, return template
    --0 = sans brique
    --1 = brique bleue
    --2 = brique jaune
    --3 = brique verte
    --4 = brique orange
    --5 = brique bleu clair
    --6 = brique vert clair
    --7 = brique rose
    --8 = brique rouge
  nbrBricks = #template * #template[1]
  
  for i = 1, #template do --rempli le tableau de briques
    for j = 1, #template[i] do --les cles commencent a 1
      if template[i][j] ~= 0 then -- partout ou il y a un 1, ajoute une brique a la place
          --Cree une brick
          brick = Brick:new(nil)
          
          --Definition des attributs de Brick
          brick:setHeight( math.abs( math.ceil( (love.graphics.getPixelHeight() - nbrBricks) * 3 / 100 ) ) ) --defini la hauteur (pourcentage arrondi au supérieur en valeur absolue)
          brick:setWidth( math.abs( math.ceil( (love.graphics.getPixelWidth() - nbrBricks) * 5 / 100 ) ) ) --defini la largeur (pourcentage arrondi au supérieur en valeur absolue)
          brick:setX( (love.graphics.getPixelWidth() / 10 ) + (j - 1) * (5 + brick:getWidth()) ) -- position en abscisse
          brick:setY( i * (love.graphics.getPixelHeight() / 35 + 10) ) -- position en ordonnee
          brick:setColorBrick(template[i][j]) --defini la couleur des briques (provisoire)
          
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
    {7, 7, 7, 7, 7, 7, 7, 7, 7},
    {7, 7, 7, 7, 7, 7, 7, 7, 7},
    {0, 7, 7, 7, 7, 7, 7, 7, 0},
    {0, 0, 7, 7, 7, 7, 7, 0, 0},
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
  return(template)
end


-----------------------------------------------------------------------------------------
--FONCTION QUI DESSINE LES BRIQUES

function drawBricks(tab)
  --parcours le tableau de briques
  for i = 1, #tab do
    for j = 1, #tab[i] do
      --si la valeur n'est pas egale a 0
      if tab[i][j] ~= 0 then
        --recuperation des attributs de la brique
        local brick = tab[i][j]
        --verification que la brique n'est pas cassee
        if brick:getBroken() == false then
          
          love.graphics.setColor(255, 105, 180)
          
          --dessine les briques, avec un bout arrondi
          love.graphics.rectangle('fill', brick:returnX(), brick:returnY(), brick:getWidth(), brick:getHeight(), 10, 10)
        end
      end
    end
  end
end
