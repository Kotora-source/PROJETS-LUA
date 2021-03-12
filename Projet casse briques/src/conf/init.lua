--[[
*** Permet d'appeler tous les fichiers nécessaires à l'éxecution en une seule ligne ***
--]]
return {
  --conf
  require ("src/conf/constants"),
  
  --controllers
  require('src/controller/collisions'),
  require('src/controller/ballcontroller'),
  require('src/controller/brickscontroller'),
  require('src/controller/racketcontroller'),
  
  --models
  require('src/models/ball'),
  require('src/models/bricks'),
  require('src/models/items'),
  require('src/models/lives'),
  require('src/models/racket'),
  
  --view
  require('src/view/level'),
  require('src/view/ballview'),
  require('src/view/bricksview'),
  require('src/view/racketview')
}
