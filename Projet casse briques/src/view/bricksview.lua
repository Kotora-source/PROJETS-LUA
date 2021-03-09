require('src/models/bricks')

-----------------------------------------------------------------------------------------
--FONCTION QUI DESSINE LES BRIQUES

--Dessine l'image correspondante à l'id de l'image qu'on veut
function drawImgBrick(brick, imgId)
  --TEMPORAIRE : placeholders de couleurs
  if imgId == 1 then
    
    love.graphics.setColor(0.1, 0.3, 0.6)
    
  elseif imgId == 2 then
    
    love.graphics.setColor(1, 1, 0)
    
  elseif imgId == 3 then
    
    love.graphics.setColor(0.1, 0.5, 0.1)
    
  elseif imgId == 4 then
    
    love.graphics.setColor(0.9, 0.5, 0)
    
  elseif imgId == 5 then
    
    love.graphics.setColor(0.2, 0.5, 0.8)
    
  elseif imgId == 6 then
    
    love.graphics.setColor(0.5, 0.6, 0.1)
    
  elseif imgId == 7 then
    
    love.graphics.setColor(0.7, 0, 0)
    
  elseif imgId == 8 then
    
    love.graphics.setColor(1, 1, 1)
    
  elseif imgId == 9 then
    
    love.graphics.setColor(0, 0, 0)
    
  end
  
  --Dessine la brique
  love.graphics.rectangle('fill', brick:returnX(), brick:returnY(), brick:getWidth(), brick:getHeight(), 5, 5)
  --Reset la couleur en noir
  love.graphics.setColor(1, 1, 1)
end


--Dessine le tableau de briques
function drawBricks(tab)
  --parcours le tableau de briques
  for i = 1, #tab do
    for j = 1, #tab[i] do
      --si la valeur n'est pas egale a 0
      if tab[i][j] ~= 0 then 
        --verification que la brique n'est pas cassee
        if tab[i][j]:getBroken() == false then
          --Dessine la brique en fonction de sa couleur
          drawImgBrick(tab[i][j], tab[i][j]:getColorBrick())
        end
      end
    end
  end
end
