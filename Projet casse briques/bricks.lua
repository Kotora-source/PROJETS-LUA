function createBrick(line, column)

  -- Fonction pour créer une brique et l'initialiser en fonction de sa position dans le mur
  local brick = {}
  brick.isNotBroken = true -- Brique pas encore cassée
  brick.width = WIN_WIDTH / BRICKS_PER_LINE - 5 -- Largeur
  brick.height = WIN_HEIGHT / 35 -- Hauteur
  brick.x = 2.5 + (column-1) * (5+brick.width) -- Position en abscisse
  brick.y = line * (WIN_HEIGHT/35+2.5) -- Position en ordonnée
  return brick
  
end

function initializeBricks()
    
    bricks = {} -- Initialisation variable pour les briques
    for line=1, BRICKS_PER_COLUMN do
      table.insert(bricks, {}) -- Ajout d'une ligne
      for column=1, BRICKS_PER_LINE do
        local brick = createBrick(line, column)
        table.insert(bricks[line], brick) -- Ajout d'une brique par colonne de la ligne
      end
    end

end