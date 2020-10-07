require('constants')

-- pour écrire dans la console au fur et à mesure, facilitant ainsi le débogage
io.stdout:setvbuf('no')

-- [[ Variables locales ]]

local racket -- Déclaration variable pour la raquette
local bricks -- Déclaration variable pour les briques
local lives -- Déclaration variable pour les vies
local ball -- Déclaration variable pour la balle

local nbBricks = BRICKS_PER_COLUMN * BRICKS_PER_LINE -- Nombre de briques
local currentPage = PAGE_BEGINNING -- Page courante

local soundBrick -- Déclaration variable son brique
local soundRacket -- Déclaration variable son raquette
local font -- Déclaration variable pour la police d'écriture

--[[ Fonctions raquette ]]

function initializeRacket()

  racket = {} -- Initialisation variable pour la raquette

  -- Initialisation de paires (clef, valeur) de la table racket
  racket.speedX = 215 -- Vitesse horizontale
  racket.width = WIN_WIDTH / 4 -- Largeur
  racket.height = WIN_HEIGHT / 37 -- Hauteur
  resetRacket() -- Position

end


function resetRacket()

  racket.x = (WIN_WIDTH-racket.width) / 2 -- Position en abscisse
  racket.y = WIN_HEIGHT - 64 -- Position en ordonnée

end

-- [[ Fonctions briques ]]

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

-- [[ Fonction vie ]]

function initializeLives()

  lives = {} -- Initialisation variable pour les vies
  lives.count = NB_LIVES -- Nombre de vie
  lives.img = love.graphics.newImage(PATH_LIFE) -- Image vie
  lives.width, lives.height = lives.img:getDimensions() -- Dimensions de l'image

end

-- [[ Fonctions balle ]]

function initializeBall(racketHeight, racketY)

  ball = {} -- Initialisation variable pour la balle
  ball.width, ball.height = racketHeight * 0.75, racketHeight * 0.75  -- Taille
  resetBall(racketY)

end


function resetBall(racketY)

  ball.speedY = -DEFAULT_SPEED_BY -- Vitesse verticale
  ball.speedX = math.random(-DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Vitesse horizontale
  ball.x = WIN_WIDTH / 2 - ball.width / 2 -- Position en abscisse
  ball.y = racketY - 2 * ball.height - ball.height / 2 -- Position en ordonnée

end


function collisionBallWithRacket()

    soundRacket:play() -- Joue le son raquette

    -- Collision par la gauche (coin haut inclus)
    if ball.x < racket.x + 1/8 * racket.width and ball.speedX >= 0 then
      if ball.speedX <= DEFAULT_SPEED_BX/2 then -- Si vitesse trop faible
        ball.speedX = -math.random(0.75*DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Nouvelle vitesse
      else
        ball.speedX = -ball.speedX
      end
    -- Collision par la droite (coin haut inclus)
    elseif ball.x > racket.x + 7/8 * racket.width and ball.speedX <= 0 then
      if ball.speedX >= -DEFAULT_SPEED_BX/2 then  -- Si vitesse trop faible
        ball.speedX = math.random(0.75*DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Nouvelle vitesse
      else
        ball.speedX = -ball.speedX
      end
    end
    -- Collision par le haut
    if ball.y < racket.y and ball.speedY > 0 then
      ball.speedY = -ball.speedY
  end

end


function collisionBallWithBrick(ball, brick)

  soundBrick:play() -- Joue le son brique

  -- Collision côté gauche brique
  if ball.x < brick.x and ball.speedX > 0 then
      ball.speedX = -ball.speedX
  -- Collision côté droit brique
  elseif ball.x > brick.x + brick.width and ball.speedX < 0 then
      ball.speedX = -ball.speedX
  end
  -- collision haut brique
  if ball.y < brick.y and ball.speedY > 0 then
    ball.speedY = -ball.speedY
  -- Collision bas brique
  elseif ball.y > brick.y and ball.speedY < 0 then
    ball.speedY = -ball.speedY
  end

  brick.isNotBroken = false -- Brique maintenant cassée
  nbBricks = nbBricks - 1 -- Ne pas oublier de décrémenter le nombre de briques

end

-- [[ Fonctions de la page partie ]]

function updateRound(dt)

  -- Mouvement vers la gauche
  if love.keyboard.isDown('left', 'q') and racket.x > 0 then
      racket.x = racket.x - (racket.speedX*dt)
  -- Mouvement vers la droite
  elseif love.keyboard.isDown('right', 'd') and racket.x + racket.width < WIN_WIDTH then
      racket.x = racket.x + (racket.speedX*dt)
  end

  -- Mise à jour position de la balle
  ball.x = ball.x + ball.speedX * dt -- Position en abscisse
  ball.y = ball.y + ball.speedY * dt -- Position en ordonnée

  -- Collision de la balle avec la fenêtre
  if ball.x + ball.width >= WIN_WIDTH then  -- Bordure droite
    ball.speedX = -ball.speedX
  elseif ball.x <= 0 then -- Bordure gauche
    ball.speedX = -ball.speedX
  end
  if ball.y <= 0 then  -- Bordure haut
    ball.speedY = -ball.speedY
  elseif ball.y + ball.height >= WIN_HEIGHT then -- Bordure bas
    lives.count = lives.count - 1
    resetBall(racket.y)
  end

  -- Collision entre la balle et la raquette
  if collideRect(ball, racket) then
    collisionBallWithRacket()
  end

  -- Collision de la balle avec les briques
  for line=#bricks, 1, -1 do
    for column=#bricks[line], 1, -1 do
      if bricks[line][column].isNotBroken and collideRect(ball, bricks[line][column]) then
        collisionBallWithBrick(ball, bricks[line][column]) -- Collision entre la balle et une brique
      end
    end
  end

  -- Test de l'état de la partie
  if lives.count == 0 or nbBricks == 0 then
    currentPage = PAGE_END -- Page de fin
  end
end


function drawRound()

  love.graphics.setColor(255, 255, 255) -- Couleur blanche

  -- Affichage de raquette
  love.graphics.rectangle('fill', racket.x, racket.y, racket.width, racket.height)

  -- Affichage des briques
  for line=1, #bricks do -- Ligne
    for column=1, #bricks[line] do -- Colonne
      local brick = bricks[line][column]
      if brick.isNotBroken then -- Si la brique n'est pas cassée
        love.graphics.rectangle('fill', brick.x, brick.y, brick.width, brick.height)
      end
    end
  end

  -- Affichage des vies
  for i=0, lives.count-1 do -- Pour chaque vie
    local posX = 5 + i * 1.20 * lives.width -- Calcul de la position en abscisse
    love.graphics.draw(lives.img, posX, WIN_HEIGHT-lives.height) -- Affichage de l'image
  end

  -- Affichage de la balle
  love.graphics.rectangle('fill', ball.x, ball.y, ball.width, ball.height)

end

-- [[ Fonctions Callback de Love2D ]]

function love.load()

  math.randomseed(love.timer.getTime()) -- Initialisation de la graine avec un temps en ms

  initializeRacket()
  initializeBricks()
  initializeLives()
  initializeBall(racket.height, racket.y)

  soundBrick = love.audio.newSource(PATH_SOUND_BRICK, "static") -- Chargement son brique
  soundRacket = love.audio.newSource(PATH_SOUND_RACKET, "static") -- Chargement son raquette

  font = love.graphics.newFont(32) -- Initialise font avec une police de taille 32
  love.graphics.setFont(font) -- Définit font comme la police utilisée

end


function love.update(dt)

  if currentPage == PAGE_BEGINNING then
    -- Traitement page début
  elseif currentPage == PAGE_ROUND then
    updateRound(dt)
  elseif currentPage == PAGE_END then
    -- Traitement page fin
  end

end

function love.draw()

  if currentPage == PAGE_BEGINNING then

    love.graphics.printf("Casse-briques", 0, 0.25*WIN_HEIGHT, WIN_WIDTH, "center") -- Écriture
    love.graphics.printf("Appuyez sur 'R' pour commencer", 0, 0.45*WIN_HEIGHT, WIN_WIDTH, "center") -- Écriture

  elseif currentPage == PAGE_ROUND then

    drawRound()

  elseif currentPage == PAGE_END then

    local message = "Victoire !"
    if lives.count == 0 then
      message = "Défaite !"
    end
    love.graphics.printf(message, 0, 0.25*WIN_HEIGHT, WIN_WIDTH, "center") -- Écriture
    love.graphics.printf("Appuyez sur 'R' pour recommencer", 0, 0.45*WIN_HEIGHT, WIN_WIDTH, "center") -- Écriture

  end

end


function love.keypressed(key)

  if key == "r" then
    if currentPage ~= PAGE_BEGINNING then

      resetRacket() -- Réinitialisation de la raquette

      -- Réinitialisation des briques
      for line=1, #bricks do
        for column=1, #bricks[line] do
          bricks[line][column].isNotBroken = true
        end
      end

      lives.count = NB_LIVES -- Réinitialisation des vies
      nbBricks = BRICKS_PER_COLUMN * BRICKS_PER_LINE -- Réinitialisation du nombre de briques
      resetBall(racket.y) -- Réinitialisation de la balle

    end
    currentPage = PAGE_ROUND -- Page jeu

  end

  if key == "escape" then
    love.event.quit() -- Pour quitter le jeu
  end

end