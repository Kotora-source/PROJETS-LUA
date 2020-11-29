--[[ tests pour maîtriser les fonctionnalités de LÖVE2D.
Ici : comment maîtriser le mode full screen, un système de pause, enfin tout pour faire un jeu correct quoi.
--]]



function love.load()
  --met en full screen
  love.window.setFullscreen(true, "desktop")

  --load un pikachu
  pikachu = love.graphics.newImage("pikachu.png")
end



function love.draw()
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

 end

--ferme la fenêtre et quitte proprement le programme quand la touche echap est pressee.
function love.keypressed(k)
   if k == 'escape' then
      love.event.quit()
   end
end
