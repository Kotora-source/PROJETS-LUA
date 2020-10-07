function initializeLives()
  
  lives = {} -- Initialisation variable pour les vies
  lives.count = NB_LIVES -- Nombre de vie
  lives.img = love.graphics.newImage(PATH_LIFE) -- Image vie
  lives.width, lives.height = lives.img:getDimensions() -- Dimensions de l'image
  
end