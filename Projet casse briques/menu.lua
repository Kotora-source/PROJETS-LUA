--creer un menu de jeu
--idees : système de points, avec mémoire quand on ferme le jeu // High scores


--TESTS
--Verifie si le tableau existe encore ou non
function ChecksifBrickTabisBroken(tableau)
  for i = 1, #tableau do
    for j = 1, #tableau[i] do
      if tableau[i][j] ~= 0 and tableau[i][j]:getBroken() == true then
        return true
      elseif tableau[i][j] ~= 0 and tableau[i][j]:getBroken() == false then
        return false
      end
    end
  end
end


--A REVOIR COMPLETEMENT
function drawMenuRestoreLvl()
  largeur = (love.graphics.getPixelWidth() * (3.5/10))
  hauteur = largeur / 2
  centre = (( love.graphics.getPixelWidth() * (4/10) ) - largeur) / 2
  y = love.graphics.getPixelHeight() / 2 - hauteur
  x = (love.graphics.getPixelWidth() * (3/10) )
  font = love.graphics.newFont("fonts/sunshine.ttf", largeur)
  Text = love.graphics.newText(font, "Press X to restart")
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Press X to restart", 0, 200, 0, 10)
end


--Restaure le tableau de brick à ses valeurs initiales
function RestoreBrickTab(tableau) 
  for i = 1, #tableau do
    for j = 1, #tableau[i] do
      if tableau[i][j] ~= 0 then
        tableau[i][j]:Restore()
      end
    end
  end
end

function DestroyallBricks(tableau)
  for i = 1, #tableau do
    for j = 1, #tableau[i] do
      if tableau[i][j] ~= 0 then
        tableau[i][j]:setBroken()
      end
    end
  end
end


