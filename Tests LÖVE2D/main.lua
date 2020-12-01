--[[ tests pour maîtriser les fonctionnalités de LÖVE2D.
Ici : comment maîtriser le mode full screen, un système de pause, enfin tout pour faire un jeu correct quoi.
--]]



function love.load()
  --met en full screen
  love.window.setFullscreen(true, "desktop")

  --load un pikachu
  --pikachu = love.graphics.newImage("pikachu.png")
  
  --load un diagramme de venn
  baseX = 300
	baseY = 400
	radius = 100
	offsetY = radius*.5*math.sqrt(3)
	love.graphics.setBackgroundColor(1, 1, 1)
  
  --calcul de la longueur de ce truc
  template = {
    {0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 1, 5, 5, 1, 1, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 5, 5, 5, 5, 5, 1, 2, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 5, 5, 5, 5, 5, 2, 2, 1, 1, 5, 5, 1, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 5, 5, 5, 1, 2, 2, 1, 5, 5, 5, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 1, 5, 1, 1, 2, 4, 1, 1, 5, 5, 1, 3, 3, 0, 0, 0},
    {0, 1, 1, 1, 1, 1, 1, 1, 4, 4, 1, 5, 5, 1, 3, 6, 6, 6, 6, 0},
    {1, 5, 5, 5, 5, 5, 1, 1, 4, 1, 1, 1, 1, 1, 1, 3, 3, 3, 6, 3},
    {1, 5, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 1, 1, 3, 6, 3},
    {1, 5, 5, 5, 5, 5, 1, 5, 1, 5, 1, 5, 5, 5, 5, 1, 3, 3, 0, 0},
    {1, 5, 5, 5, 1, 1, 5, 5, 1, 5, 1, 1, 5, 5, 5, 1, 0, 0, 0, 0},
    {1, 5, 5, 1, 1, 1, 5, 5, 5, 5, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
    {0, 1, 1, 1, 0, 1, 5, 5, 5, 5, 5, 1, 3, 3, 3, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 5, 5, 5, 5, 1, 1, 3, 3, 6, 3, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 3, 3, 6, 3, 6, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 6, 6, 6, 6, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0}
  }
  
end



function love.draw()
  --affiche un diagramme de venn
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

  --[[
  --affiche un pikachu
  love.graphics.draw(pikachu)


  --récupère les infos de la taille de l'écran et les affiche.
  local _, _, flags = love.window.getMode()

  -- The window's flags contain the index of the monitor it's currently in.
  local width, height = love.window.getDesktopDimensions(flags.display)

  love.graphics.print(("display %d: %d x %d"):format(flags.display, width, height), 4, 10)

  --affiche les fps
  scale = love.window.getDPIScale( )
  love.graphics.print(scale, 4, 30)
  --]]
 end

--ferme la fenêtre et quitte proprement le programme quand la touche echap est pressee.
function love.keypressed(k)
   if k == 'escape' then
      love.event.quit()
   end
end
