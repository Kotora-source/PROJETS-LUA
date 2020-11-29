--tuto suivi sur le site suivant
--https://zestedesavoir.com/tutoriels/1399/un-jeu-de-casse-briques-en-lua-avec-love2d/ VOUS PUEZ LA MERDE LES MECS
--tentative d'amélioration et de création de fichiers objets A TESTER

--appel des fichiers 
require ('constants')
require ('racket')
require ('bricks')
require ('lives')
require ('ball')
require('collisions')

-- pour écrire dans la console au fur et à mesure, facilitant ainsi le débogage
io.stdout:setvbuf('no') 

function love.load()
  -- Fonction pour initialiser le jeu (appelée au début de celui-ci)
  
  love.window.setFullscreen(true, "desktop") -- Met en plein ecran
  
  math.randomseed(love.timer.getTime()) -- Initialisation de la graine avec un temps en ms
  
  r = Racket:new(nil)
  initializeBricks()
  initializeLives()
  initializeBall(r.height, r.y)
  
  game_paused = false --Mise en pause du jeu

--fin de love.load
end

function love.update(dt)
  -- Fonction pour mettre à jour (appelée à chaque frame)
  
  if game_paused == false then --si le jeu n'est pas en pause
    
    --mouvements de la raquette (a revoir en creeant des fichiers objets)
    r:Movment(dt)
    
    --mouvements de la balle
    MovmentBall(dt)
    
  end
  
  --on reprends le tuto 3 min pour piger comment ils ont fait les mecs
  if collideRect(ball, r) then
    collisionBallWithRacket(r) -- Collision entre la balle et la raquette
  end
  --C'EST DE LA MERDE SON TUTO PUTAIN

--fin de love.update
end

function love.draw()
  -- Fonction pour dessiner (appelée à chaque frame)
  
  --dessine la raquette
  r:Affichage()
  
  --dessine les briques
  drawBricks()
  
  --affichage des vies
  drawLives()
  
  --affichage de la balle
  drawBall()

--fin de love.draw
end

function love.keypressed(key)
  -- Fonction pour gérer l'appui sur les touches (appelée pour chaque touche pressée)  
  
  --entre dans le jeu apres le menu
  if key == 'enter' then
  --mettre les methodes
  end
  
  --quitte le jeu quand la touche "esc" est pressee
  if key == 'escape' then 
      love.event.quit()
   end
    
  --Met en pause le jeu
  if key == 'p' then
    if game_paused == false then
      game_paused = true
    elseif game_paused == true then
      game_paused = false      
    end
  end
  
--fin de love.keypressed
end