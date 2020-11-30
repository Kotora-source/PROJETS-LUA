function initializeBall(racketHeight, racketY)
  
  ball = {} -- Initialisation variable pour la balle
  ball.width, ball.height = racketHeight * 0.75, racketHeight * 0.75  -- Taille
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
              if ball.x + ball.width >= love.graphics.getPixelWidth() then  -- Bordure droite
              ball.speedX = -ball.speedX
            elseif ball.x <= 0 then -- Bordure gauche
              ball.speedX = -ball.speedX
            end

            if ball.y <= 0 then  -- Bordure haut
              ball.speedY = -ball.speedY
            elseif ball.y + ball.height >= love.graphics.getPixelHeight( ) then -- Bordure bas
              lives.count = lives.count - 1 --C'EST LA COLLISION LA PLUS CASSEE QUE J'AI JAMAIS VUE DE MA VIE 
              resetBall(racket:returnY()) -- FAUT QUE JE REFASSE CA C'EST NIMPORTE QUOI
            end
end

function drawBall()
  love.graphics.rectangle('fill', ball.x, ball.y, ball.width, ball.height) -- Rectangle
end

function collisionBallWithRacket(racket)
  
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