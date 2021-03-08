--[[ tests pour maîtriser les fonctionnalités de LÖVE2D.
Ici : comment maîtriser le mode full screen, un système de pause, enfin tout pour faire un jeu correct quoi.
--]]



function love.load()
  --met en full screen
  love.window.setFullscreen(true, "desktop")

  --load un pikachu
  pikachu = love.graphics.newImage("pikachu.png")
  
  
  height = pikachu:getHeight()
  width = pikachu:getWidth()
  
  --[[load un diagramme de venn
  baseX = 300
	baseY = 400
	radius = 100
	offsetY = radius*.5*math.sqrt(3)
	love.graphics.setBackgroundColor(1, 1, 1)
  
  --calcul de la longueur de ce truc
  template = 
    { 
      {0, 7, 7, 7, 0, 7, 7, 7, 0},
      {7, 7, 7, 7, 7, 7, 7, 7, 7},
      {7, 7, 7, 8, 7, 8, 7, 7, 7},
      {7, 7, 8, 8, 8, 8, 8, 7, 7},
      {0, 7, 7, 8, 8, 8, 7, 7, 0},
      {0, 0, 7, 7, 8, 7, 7, 0, 0},
      {0, 0, 0, 7, 7, 7, 0, 0, 0},
      {0, 0, 0, 0, 7, 0, 0, 0, 0}
    } --]]
  
end



function love.draw()
  --[[affiche un diagramme de venn
  love.graphics.setColor(0.1, 0.3, 0.6)--test de la couleur
	love.graphics.circle('fill', baseX, baseY, radius)
	love.graphics.setColor(0, 1, 0, 0.4)
	love.graphics.circle('fill', baseX + radius / 2, baseY - offsetY, radius)
	love.graphics.setColor(0, 0, 1, 0.4)
	love.graphics.circle('fill', baseX + radius, baseY, radius)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(#template, 600, 600)
  love.graphics.print(#template[1], 600, 700)
  love.graphics.print((#template[1] * #template), 600, 800) --340
  --]]
  --
  --affiche un pikachu
  love.graphics.draw(pikachu, 500, 500, 6, 0.09)

  love.graphics.print(width, 50, 50)
  love.graphics.print(height, 150, 50)
 end

--ferme la fenêtre et quitte proprement le programme quand la touche echap est pressee.
function love.keypressed(k)
   if k == 'escape' then
      love.event.quit()
   end
end
