require('src/models/bricks')

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
    --9 = brique noire : color (0, 0, 0)

--Fonction qui rempli le tableau // pas encore optimale
function createPattern(template) --@param template le tableau, return template
  --Parcourt le tableau de briques
  for i = 1, #template do
    for j = 1, #template[i] do --les cles commencent a 1
      if template[i][j] ~= 0 then -- partout ou il y a un chiffre autre que 0, ajoute une brique a la place
          --Cree une brick
          brick = Brick:new(nil)
          
          --Definition des attributs de Brick
          -- defini la hauteur et la largeur (s'adapte a la largeur de chaque motif, occupe 3.5/10 de l'ecran)
          l = math.ceil( (love.graphics.getPixelWidth() * (3.5/10)) / #template[1])
          brick:setHeight( l ) 
          brick:setWidth( l )
          
          --Trouve le centre
          centre = (((love.graphics.getPixelWidth() * (4/10)) - (#template[i] * (1 + brick:getWidth()))) - 1) / 2 
          
          --defini l'abscisse (sur 1/3 de l'ecran) et l'ordonnee (en fonction du nbr de bricks), arrondis au superieur en valeur absolue
          brick:setX( math.abs( math.ceil( (love.graphics.getPixelWidth() * (3/10) ) + (j-1) * ( 1 + brick:getWidth() ) + centre ) ) ) 
          brick:setY( math.abs( math.ceil( (love.graphics.getPixelHeight() * (1/10) ) + i * ( 1 + brick:getWidth() ) ) ) ) 
          
          brick:setColorBrick(template[i][j]) --defini la couleur des briques 
          
          resistance = math.random(0, 3) --defini une resistance au pif entre 0 et 3
          
          brick:setResistance(resistance) --defini la resistance de la brick
          
          brick:setScoreValue( (resistance + 1) * 10) --defini la valeur en score de la brick
          
          --Place la brick dans le tableau a la place de la valeur 1
          template[i][j] = brick
      end
    end
  end
  return template
end


--Cree un motif de briques
function createBrickPattern(number)
  if number == 1 then
    --Motif de coeur (72)
    template = 
    { 
      {0, 7, 7, 7, 0, 7, 7, 7, 0},
      {7, 7, 7, 7, 7, 7, 7, 7, 7},
      {7, 7, 7, 8, 7, 8, 7, 7, 7},
      {7, 7, 8, 8, 8, 8, 8, 7, 7},
      {0, 7, 7, 8, 8, 8, 7, 7, 0},
      {0, 0, 7, 7, 8, 7, 7, 0, 0},
      {0, 0, 0, 7, 7, 7, 0, 0, 0},
      {0, 0, 0, 0, 7, 0, 0, 0, 0}
    }
  elseif number == 2 then
    --Motif de fleur d'hibiscus (340)
    template = 
    {
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
  elseif number == 3 then
    --Motif de diamant (221)
    template = 
    {
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
  elseif number == 4 then
    --Motif etoile (462)
    template = 
    {
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 4, 4, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 9, 4, 2, 2, 4, 9, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 9, 4, 2, 2, 2, 2, 4, 9, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 9, 4, 2, 2, 2, 2, 4, 9, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 9, 4, 2, 2, 2, 2, 2, 2, 4, 9, 0, 0, 0, 0, 0, 0},
      {9, 9, 9, 9, 9, 9, 4, 2, 2, 2, 2, 2, 2, 2, 2, 4, 9, 9, 9, 9, 9, 0},
      {9, 4, 4, 4, 4, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 9},
      {9, 4, 2, 2, 2, 2, 9, 8, 2, 2, 2, 2, 2, 2, 8, 9, 2, 2, 2, 2, 4, 9},
      {0, 9, 4, 2, 2, 2, 9, 9, 2, 2, 2, 2, 2, 2, 9, 9, 2, 2, 2, 4, 9, 0},
      {0, 0, 9, 4, 2, 7, 7, 2, 2, 2, 2, 2, 2, 2, 2, 7, 7, 2, 4, 9, 0, 0},
      {0, 0, 9, 4, 2, 2, 2, 2, 2, 9, 2, 2, 9, 2, 2, 2, 2, 2, 4, 9, 0, 0},
      {0, 0, 0, 9, 4, 2, 2, 2, 2, 9, 9, 9, 9, 2, 2, 2, 2, 4, 9, 0, 0, 0},
      {0, 0, 0, 0, 9, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 9, 0, 0, 0, 0},
      {0, 0, 0, 0, 9, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 9, 0, 0, 0, 0},
      {0, 0, 0, 9, 4, 2, 2, 2, 2, 4, 4, 4, 4, 2, 2, 2, 2, 4, 9, 0, 0, 0},
      {0, 0, 0, 9, 4, 2, 2, 2, 4, 9, 9, 9, 9, 4, 2, 2, 2, 4, 9, 0, 0, 0},
      {0, 0, 9, 4, 2, 2, 2, 4, 9, 0, 0, 0, 0, 9, 4, 2, 2, 2, 4, 9, 0, 0},
      {0, 0, 9, 4, 2, 4, 4, 9, 0, 0, 0, 0, 0, 0, 9, 4, 4, 2, 4, 9, 0, 0},
      {0, 0, 9, 4, 4, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 4, 4, 9, 0, 0},
      {0, 0, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 9, 0, 0}
    }
  end
  
  return createPattern(template)
end
