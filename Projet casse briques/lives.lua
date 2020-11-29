function initializeLives()
  
  lives = {} -- Initialisation variable pour les vies
  lives.count = NB_LIVES -- Nombre de vie
  lives.img = love.graphics.newImage(PATH_LIFE) -- Image vie
  lives.width, lives.height = lives.img:getDimensions() -- Dimensions de l'image
  
end

function drawLives()
  for i=0, lives.count-1 do -- Pour chaque vie
      local posX = 5 + i * 1.20 * lives.width -- Calcul de la position en abscisse
      love.graphics.draw(lives.img, posX, WIN_HEIGHT-lives.height) -- Affichage de l'image
    end
end