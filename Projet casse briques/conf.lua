require ('src/conf/constants')

function love.conf(t)

  t.window.title = TITLE -- Change le titre de la fenêtre
  t.window.icon = PATH_ICON -- Change l'icone de la fenêtre
  t.window.width = 1500 -- Change la largeur de la fenêtre
  t.window.height = 1200 -- Change la hauteur de la fenêtre
  t.window.resizable = true

end