function initializeBall(racketHeight, racketY)
  
  ball = {} -- Initialisation variable pour la balle
  ball.width, ball.height = racketHeight * 0.75, racketHeight * 0.75  -- Taille
  ball.speedY = -DEFAULT_SPEED_BY -- Vitesse verticale
  ball.speedX = math.random(-DEFAULT_SPEED_BX, DEFAULT_SPEED_BX) -- Vitesse horizontale
  ball.x = WIN_WIDTH / 2 - ball.width / 2 -- Position en abscisse
  ball.y = racketY - 2 * ball.height - ball.height / 2 -- Position en ordonnée
    
end