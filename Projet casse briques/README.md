# Projet tiré d'un tuto : https://zestedesavoir.com/tutoriels/1399/un-jeu-de-casse-briques-en-lua-avec-love2d/

# Premier projet commencé en Lua (07/10/2020)

# Tentative d'amélioration en créant des classes objets + autres fonctionnalités au niveau du jeu + skins personnalisés

Gestionnaire de mise en pause
https://hump.readthedocs.io/en/latest/gamestate.html
--> a voir quand j'aurai le lvl.
-----> a voir si je peux pas le coder moi-même, carrément.
https://www.reddit.com/r/love2d/comments/8oaun9/can_someone_do_a_example_on_how_to_pause_a_game/

Musique et graphismes à venir (faits par des amis)

Lua math
http://www.luteus.biz/Download/LoriotPro_Doc/LUA/LUA_Training_FR/LUA_Fonctions_Math.html#mathsqrt

Crack absolu des collisions :
https://pub.phyks.me/sdz/sdz/eorie-des-collisions.html

Idees de motifs de briques :
Dinosaure
Crocodile
Basse électrique

Skins de balle
Skins de raquette

IDEE
Titre : Fairy Brick Adventures
spliter l'écran en 3 parties, avec le jeu au milieu, et sur les côtés afficher les scores, les vies, les balles à disposition, les bonus/malus, et d'autres infos type
"appuyer sur ESC pour quitter" ou "P pour pause" jsp

1ere partie : gauche
Taille : 3/10 de l'écran
Contient : 
le nbr de vies restantes
le titre du jeu
le niveau sur lequel on se trouve (lvl 1, 2, ...)
une img de background

2e partie : jeu, gameplay : 
Taille : 4/10 de l'écran
Contient :
les briques
les balles
la raquette
une image de background

3e partie : scores
Taille : 3/10 de l'écran
Contient :
Le tableau des scores
le compteur des scores
le compteur des balles restantes (si plusieurs affichées à l'écran)
Les items / bonus / malus actifs avec un timer
Le temps passé sur le niveau (doit se stopper avec la pause)


Soit a1 l'angle entre le vecteur vitesse avant choc et une reference quelconque ( on va prendre l'horizontale).
 
Soit a2 l'angle entre la droite passant par le centre de la boule et le coin, et cette même horizontale.  
a2=arctan((Ycentre-Ycoin)/(Xcentre-Xcoin))
 
L'angle entre vecteur vitesse de la boule apres le choc et l'horizontale (encore elle) est tout simplement :
 
2*a2 - a1 - Pi