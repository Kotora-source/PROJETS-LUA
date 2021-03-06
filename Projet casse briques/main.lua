--appel des fichiers 
require('src/conf/init')

-- pour écrire dans la console au fur et à mesure, facilitant ainsi le débogage
io.stdout:setvbuf('no') 

function love.load()
  -- Fonction pour initialiser le jeu (appelée au début de celui-ci)
  
  love.window.setFullscreen(false, "desktop") -- Met en plein ecran
  
  love.mouse.setVisible(false) --cache le curseur de la souris
  
  math.randomseed(love.timer.getTime()) -- Initialisation de la graine avec un temps en ms
  
  --Appel des fichiers sonores
  --Une fois que tout sera pret, faire le mixage du son (les sons pas au meme volume que la musique par ex).
  soundRacket = love.audio.newSource(PATH_SOUND_RACKET, "static")
  soundBrick = love.audio.newSource(PATH_SOUND_BRICK, "static")
  soundBreakingBrick = love.audio.newSource(PATH_SOUND_BREAKING_BRICK, "static")
  
  titlefont = love.graphics.newFont(PATH_FONT, 1000)
  titletext = love.graphics.newText(titlefont, TITLE)
  
  
  r = Racket:new(nil)
  
  tab = createBrickPattern(1)--mettre ici la fonction qui initialize les briques, a voir plus tard avec les differents lvls
  
  initializeLives()
  
  ball = Ball:new(nil)
  
  ball:initializeBall(r:getHeight(), r:returnY())
  
  game_paused = false --Mise en pause du jeu
  
  score = 0  

--fin de love.load
end

function love.update(dt)
  
  -- Fonction pour mettre à jour (appelée à chaque frame)
  
  if game_paused == false then --si le jeu n'est pas en pause
    
    --mouvements de la raquette (a revoir en creeant des fichiers objets)
    r:Movment(dt)
    
    --mouvements de la balle
    ball:MovmentBall(dt, r)
    
  end
  
  if collideRect(ball, r) then
    ball:collisionBallWithRacket(r, soundRacket) -- Collision entre la balle et la raquette
  end
  
  
  broken, brickbroke = ball:collisionBallWithBrickTab(tab, soundBrick, soundBreakingBrick)
  
  if broken == true then
    score = score + brickbroke:getScoreValue()
  end
  
  
 
  
    
--fin de love.update
end

function love.resize()
 --actualisation des objets à l'écran
  actualizePattern(tab)
  
  r:actualizeposition()
  
  ball:initializeBall(r:getHeight(), r:returnY())
  
  --fin de live.resize
end
  
function love.draw()
  --dessine le menu
  drawlevel(score, titletext)
  
  --dessine la raquette
  r:draw()
  
  --dessine les briques
  drawBricks(tab)
  
  --affichage des vies
  drawLives()
  
  --affichage de la balle
  ball:drawBall()

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

function love.focus(f)
  --check si l'user est toujours sur la fenetre
  if f == false then
    game_paused = true
  else
    game_paused = false
  end
    
  --fin de love.focus
end
