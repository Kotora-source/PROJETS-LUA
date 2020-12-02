function initializeBall(racketHeight, racketY)
  
  ball = {} -- Initialisation variable pour la balle
  ball.width, ball.height = racketHeight * 0.5, racketHeight * 0.5  -- Taille
  ball.speedY = -DEFAULT_SPEED_BY -- Vitesse verticale
  ball.speedX = math.random(-DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Vitesse horizontale
  ball.x = love.graphics.getPixelWidth() / 2 - ball.width / 2 -- Position en abscisse
  ball.y = racketY - 2 * ball.height - ball.height / 2 -- Position en ordonnée
    
end

function resetBall(racketY)
  
  ball.speedY = -DEFAULT_SPEED_BY -- Vitesse verticale
  ball.speedX = math.random(-DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Vitesse horizontale
  ball.x = love.graphics.getPixelWidth() / 2 - ball.width / 2 -- Position en abscisse
  ball.y = racketY - 2 * ball.height - ball.height / 2 -- Position en ordonnée
  
end

function MovmentBall(dt, racket)
  ball.x = ball.x + ball.speedX * dt -- Mise à jour position en abscisse de la balle
  ball.y = ball.y + ball.speedY * dt -- Mise à jour position en ordonnée de la balle
    
    --a modifier c'est juste pour s'approprier le fonctionnement (créer une classe 'collisions')
              if ball.x + ball.width >= ( love.graphics.getPixelWidth() * (7/10) ) then  -- Bordure droite
              ball.speedX = -ball.speedX
            elseif ball.x - ball.width <= ( love.graphics.getPixelWidth() * (3/10) ) then -- Bordure gauche
              ball.speedX = -ball.speedX
            end

            if ball.y <= 0 then  -- Bordure haut
              ball.speedY = -ball.speedY
            elseif ball.y + ball.height >= love.graphics.getPixelHeight( ) then -- Bordure bas
              lives.count = lives.count - 1 
              resetBall(racket:returnY()) 
              racket:resetRacket()
            end
end

function drawBall()
  love.graphics.setColor(0, 0, 0)
  love.graphics.circle('fill', ball.x, ball.y, ball.width) -- Rectangle
end

function collisionBallWithRacket(racket, sourcesound)
  
    -- Collision par la gauche (coin haut inclus)
    if ball.x < racket.x + 1/8 * racket.width and ball.speedX >= 0 then --je pige rien c'est exceptionnel, une **** en maths bonjour
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
    if ball.y - ball.width < racket.y and ball.speedY > 0 then
      ball.speedY = -ball.speedY
  end
  
  love.audio.play(sourcesound)
end