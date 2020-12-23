--creer un menu de jeu
--idees : système de points, avec mémoire quand on ferme le jeu // High scores

function tabscores(score, tab)
  score = score + 1
  return score
end

function drawscore(score)
  love.graphics.print("SCORE", (love.graphics.getPixelWidth() * (7/10)), (love.graphics.getPixelHeight() / 100), 0, 1)
  
  love.graphics.print(tostring(score), (love.graphics.getPixelWidth() * (7/10)), ((love.graphics.getPixelHeight() / 100) + 100), 0, 1)
end

