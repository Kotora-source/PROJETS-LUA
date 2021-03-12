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

Quand la brique se brise, une animation de coeur apparaît (en transparence)

La balle de base a un motif de coeur.
Les balles déblocables s'achètent avec des coins ou se trouvent dans les niveaux. Si elle sort de l'écran, elle est perdue.
Le joueur a de base 3 balles de base et autant de balles achetables/trouvables qu'il veut.
Les bonus apparaissent de manière aléatoires et non contrôlées par moi dans le tableau de briques. Mais la chance
que ces bonus apparaissent est contrôlée selon leur nature et celle du tableau (selon le niveau)

Il y a un scénario :
"Un vil mage sévit dans le monde magique de fairy brick, notre héros doit les sauver !
elles ont été changées en monstres qui attaquent les villes de ce monde. a l'aide de sa balle,
le joueur doit toutes les détruire pour pouvoir ensuite affronter le méchant"
Scénario à améliorer évidemment parce que si je fais ça propre j'en ai pour 3 ans de dev sans compter les musiques et les graphismes.

Skins de balle
Skins de raquette

Bouger la raquette avec la souris

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

Angle de trajectoire (vecteurs)
Soit a1 l'angle entre le vecteur vitesse avant choc et une reference quelconque ( on va prendre l'horizontale).
 
Soit a2 l'angle entre la droite passant par le centre de la boule et le coin, et cette même horizontale.  
a2=arctan((Ycentre-Ycoin)/(Xcentre-Xcoin))
 
L'angle entre vecteur vitesse de la boule apres le choc et l'horizontale (encore elle) est tout simplement :
 
2*a2 - a1 - Pi

try and catch en lua :
https://www.lua.org/wshop06/Belmonte.pdf

soit X le scale factor de width
le nombre que l'on cherche donc

soit Z la width de l'image (fixe)
soit Y la width de la brick actuelle qui est calculée
en fonction de la taille de l'écran

Z * X = Y

X = Y / Z