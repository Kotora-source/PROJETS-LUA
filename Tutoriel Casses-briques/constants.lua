TITLE = "Casse-briques" -- Titre
PATH_ICON = "images/icon.png" -- Chemin image icône
WIN_WIDTH = 480 -- Largeur fenêtre
WIN_HEIGHT = 640 -- Hauteur fenêtre

BRICKS_PER_LINE = 7 -- Nombre de briques par ligne
BRICKS_PER_COLUMN = 6 -- Nombre de briques par colonne

NB_LIVES = 3 -- Nombre de vies initiales
PATH_LIFE = "images/life.png" -- Chemin image vie

DEFAULT_SPEED_BX = 130 -- Vitesse horizontale
DEFAULT_SPEED_BY = 335 -- Vitesse verticale

PATH_SOUND_BRICK = "sounds/collision_brick.wav" -- Chemin son brique
PATH_SOUND_RACKET = "sounds/collision_racket.wav" -- Chemin son raquette

PAGE_BEGINNING = 1 -- Page de début
PAGE_ROUND = 2 -- Page de partie
PAGE_END = 3 -- Page de fin

-- Fonction pour tester la collision entre deux rectangles
function collideRect(rect1, rect2)
  if rect1.x < rect2.x + rect2.width and
     rect1.x + rect1.width > rect2.x and
     rect1.y < rect2.y + rect2.height and
     rect1.height + rect1.y > rect2.y then
       return true
  end
  return false
end