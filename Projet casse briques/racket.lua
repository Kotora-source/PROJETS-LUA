--Fichier definissant la raquette du casse briques

--[[
--TENTATIVE DE CREATION D'UN FICHIER OBJET
racket = {} -- Initialisation variable pour la raquette (tableau)

local __instance = {__index=racket}

function racket.new()
  local instance = {}
  setmetatable(instance, __instance)
  return instance
end

--Initialisation des attributs de Racket
racket.speedX = 215 -- Vitesse horizontale
racket.width = WIN_WIDTH / 4 -- Largeur
racket.height = WIN_HEIGHT / 37 -- Hauteur
racket.x = (WIN_WIDTH-racket.width) / 2 -- Position en abscisse
racket.y = WIN_HEIGHT - 64 -- Position en ordonnée

--Fonctions ? tester si fonctionne
--retourne la position X
racket:getX()
  return self.x
end

--retourne la position Y
racket:getY()
  return self.y
end

--retourne la vitesse
racket:getSpeedX()
  return self.speedX
end

--retourne la largeur
racket:getWidth()
  return self.width
end

--retourne la hauteur
racket:getHeight()
  return self.height
end

--a voir pour love.load ? comment faire ?

--a mettre dans love.update
racket:Movment(dt)
   -- Mouvement vers la gauche
  if love.keyboard.isDown('left', 'q') and self.x > 0 then
      self.x = self.x - (self.speedX*dt)
  -- Mouvement vers la droite
  elseif love.keyboard.isDown('right', 'd') and self.x + self.width < WIN_WIDTH then
      self.x = self.x + (self.speedX*dt)
  end
end

--a mettre dans love.draw
racket:Affichage()
  love.graphics.setColor(255, 255, 255) -- Couleur blanche
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height) -- Rectangle
end

--]]


--début du code pris sur le site (A REVOIR pour adapter au fonctionnement objet)
function initializeRacket()
  
  racket = {} --initalisation de la raquette
  
  -- Initialisation de paires (clef, valeur) de la table racket
  racket.speedX = 215 -- Vitesse horizontale
  racket.width = WIN_WIDTH / 4 -- Largeur
  racket.height = WIN_HEIGHT / 37 -- Hauteur
  racket.x = (WIN_WIDTH-racket.width) / 2 -- Position en abscisse
  racket.y = WIN_HEIGHT - 64 -- Position en ordonnée

end