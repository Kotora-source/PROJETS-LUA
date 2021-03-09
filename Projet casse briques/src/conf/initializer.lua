return {
  --conf
  require ("src/conf/constants"),
  require('src/conf/conf'),
  
  --controllers
  require('src/controller/collisions'),
  
  --models
  require('src/models/ball'),
  require('src/models/bricks'),
  require('src/models/items'),
  require('src/models/lives'),
  require('src/models/racket'),
  
  --view
  require('src/view/menu')
}
