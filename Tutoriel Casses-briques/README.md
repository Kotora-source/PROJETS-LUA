# Retranscription exacte du tuto https://zestedesavoir.com/tutoriels/1399/un-jeu-de-casse-briques-en-lua-avec-love2d/

Distribution
Maintenant que nous disposons d’une première version jouable de notre jeu, il peut être sympa d’en faire profiter les 
autres et de savoir ce qu’ils en pensent. En effet, quoi de plus normal que de vouloir que l’on joue à notre jeu et 
l’améliorer?? Avec Love2D, il existe plusieurs manières de distribuer son jeu.

En créant un fichier «.love»
La plus simple consiste à créer un fichier «?.love?» qui pourra être exécuté sur les machines ayant une version compatible
de Love2D d’installée. Pour cela, il faut d’abord se placer dans le répertoire contenant tout notre jeu (code et ressources)
et s’assurer que le fichier main.lua se trouve à la racine de celui-ci, sans quoi cela ne fonctionnera pas. Comme c’est 
bon dans notre cas, nous pouvons sélectionner tout le contenu puis le compresser en un fichier «?.zip?» (clique droit 
puis compresser sous Ubuntu). Une fois cela fait, il ne reste plus qu’à renommer le fichier en remplaçant l’extension par 
«love». L’icône change et il est alors possible d’exécuter le jeu en double-cliquant sur le fichier.
