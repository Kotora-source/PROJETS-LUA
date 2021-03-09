return {
  --conf
  require ("src/conf/constants"),
  require('src/conf/conf'),
  
  --controllers
  require('src/controller/collisions'),
  require('src/controller/ballcontroller'),
  require('src/controller/brickscontroller'),
  
  --models
  require('src/models/ball'),
  require('src/models/bricks'),
  require('src/models/items'),
  require('src/models/lives'),
  require('src/models/racket'),
  
  --view
  require('src/view/menu'),
  require('src/view/ballview'),
  require('src/view/bricksview')
}
