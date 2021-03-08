--creer un menu de jeu
--idees : système de points, avec mémoire quand on ferme le jeu // High scores

--Dessine le menu, les scores, etc
function drawmenu(score)
  love.graphics.setBackgroundColor(0.8, 0.8, 0.6)
  
  --dessine les bords sur les cotés
  --couleur vieux rose
  love.graphics.setColor(0.7, 0.5, 0.8)
  --bord gauche
  love.graphics.rectangle('fill', 0, 0, (love.graphics.getPixelWidth() * (3/10) ), love.graphics.getPixelHeight())
  --bord droit
  love.graphics.rectangle('fill', ( love.graphics.getPixelWidth() * (7/10) ), 0, ( love.graphics.getPixelWidth() - ( love.graphics.getPixelWidth() * (7/10) ) ), love.graphics.getPixelHeight())
  --bord du haut
  love.graphics.rectangle('fill', 0, 0, love.graphics.getPixelWidth(), (love.graphics.getPixelHeight() * (1/10)) )
  
  --reset en noir
  love.graphics.setColor(0, 0, 0)
  
  drawscore(score)
  drawtitle()
end

--fonction privée, dessine le score
function drawscore(score)
  score = "SCORE : " .. tostring(score)  
  love.graphics.print(score, (love.graphics.getPixelWidth() * (7/10) + 10), (love.graphics.getPixelHeight() / 100), 0, 1)
end

function drawtitle()
  title = "Fairy Brick Adventures"
  love.graphics.print(title, (love.graphics.getPixelWidth() * (3/10) + 10), (love.graphics.getPixelHeight() / 100), 0, 1)
end

