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
  
  r = Racket:new(nil)
  initializeBricks()
  initializeLives()
  initializeBall(r.height, r.y)
  
  game_paused = false --Mise en pause du jeu, a tester

--fin de love.load
end

function love.update(dt)
  -- Fonction pour mettre à jour (appelée à chaque frame)
  if game_paused == false then
    
    --mouvements de la raquette (a revoir en creeant des fichiers objets)
    r:Movment(dt)
    
    --mouvements de la balle
    MovmentBall(dt)
    
  end
  
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
  
  --quitte le jeu quand la touche "esc" est pressee
  if key == 'escape' then 
      love.event.quit()
   end
   
  --affiche les fps //Marche pas trop pour le moment, je dois trouver ou le mettre
  if key == 'f3' then
      scale = love.window.getDPIScale( )
      love.graphics.print(scale, 150, 300)
    end
    
  --Met en pause le jeu, a tester
  if key == 'p' then
    if game_paused == false then
      game_paused = true
    elseif game_paused == true then
      game_paused == false      
    end
  end
  
  
--fin de love.keypressed
end