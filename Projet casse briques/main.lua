--tuto suivi sur le site suivant
--https://zestedesavoir.com/tutoriels/1399/un-jeu-de-casse-briques-en-lua-avec-love2d/
--tentative d'amélioration et de création de fichiers objets A TESTER

--appel des fichiers 
require ('constants')
require ('racket')
require ('bricks')
require ('lives')
require ('ball')

-- pour écrire dans la console au fur et à mesure, facilitant ainsi le débogage
io.stdout:setvbuf('no') 

function love.load()
  -- Fonction pour initialiser le jeu (appelée au début de celui-ci)
  
  math.randomseed(love.timer.getTime()) -- Initialisation de la graine avec un temps en ms
  
  initializeRacket()
  initializeBricks()
  initializeLives()
  initializeBall(racket.height, racket.y)

--fin de love.load
end

function love.update(dt)
  -- Fonction pour mettre à jour (appelée à chaque frame)
  
  --mouvements de la raquette (a revoir en creeant des fichiers objets)
  -- Mouvement vers la gauche
  if love.keyboard.isDown('left', 'q') and racket.x > 0 then
      racket.x = racket.x - (racket.speedX*dt)
  -- Mouvement vers la droite
  elseif love.keyboard.isDown('right', 'd') and racket.x + racket.width < WIN_WIDTH then
      racket.x = racket.x + (racket.speedX*dt)
  end
  
  --mouvements de la balle
  ball.x = ball.x + ball.speedX * dt -- Mise à jour position en abscisse de la balle
  ball.y = ball.y + ball.speedY * dt -- Mise à jour position en ordonnée de la balle
  
--fin de love.update
end

function love.draw()
  -- Fonction pour dessiner (appelée à chaque frame)
  
  --dessine la raquette
  love.graphics.setColor(255, 255, 255) -- Couleur blanche
  love.graphics.rectangle('fill', racket.x, racket.y, racket.width, racket.height) -- Rectangle
  
  --dessine les briques
  for line=1, #bricks do -- Ligne
    for column=1, #bricks[line] do -- Colonne
      local brick = bricks[line][column]
      if brick.isNotBroken then -- Si la brique n'est pas cassée
        love.graphics.rectangle('fill', brick.x, brick.y, brick.width, brick.height) -- Rectangle
      end
    end
  end
  
  --affichage des vies
  for i=0, lives.count-1 do -- Pour chaque vie
    local posX = 5 + i * 1.20 * lives.width -- Calcul de la position en abscisse
    love.graphics.draw(lives.img, posX, WIN_HEIGHT-lives.height) -- Affichage de l'image
  end
  
  --affichage de la balle
  love.graphics.rectangle('fill', ball.x, ball.y, ball.width, ball.height) -- Rectangle

--fin de love.draw
end

function love.keypressed(key)
  -- Fonction pour gérer l'appui sur les touches (appelée pour chaque touche pressée)  
  
--fin de love.keypressed
end