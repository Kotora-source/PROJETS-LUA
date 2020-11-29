function initializeBall(racketHeight, racketY)
  
  ball = {} -- Initialisation variable pour la balle
  ball.width, ball.height = racketHeight * 0.75, racketHeight * 0.75  -- Taille
  ball.speedY = -DEFAULT_SPEED_BY -- Vitesse verticale
  ball.speedX = math.random(-DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Vitesse horizontale
  ball.x = WIN_WIDTH / 2 - ball.width / 2 -- Position en abscisse
  ball.y = racketY - 2 * ball.height - ball.height / 2 -- Position en ordonnée
    
end

function MovmentBall(dt)
  ball.x = ball.x + ball.speedX * dt -- Mise à jour position en abscisse de la balle
  ball.y = ball.y + ball.speedY * dt -- Mise à jour position en ordonnée de la balle
    
    --a modifier c'est juste pour s'approprier le fonctionnement (créer une classe 'collisions')
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
end

function drawBall()
  love.graphics.rectangle('fill', ball.x, ball.y, ball.width, ball.height) -- Rectangle
end