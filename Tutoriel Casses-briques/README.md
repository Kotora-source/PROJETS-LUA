# Retranscription exacte du tuto https://zestedesavoir.com/tutoriels/1399/un-jeu-de-casse-briques-en-lua-avec-love2d/

# Distribution
# Maintenant que nous disposons d�une premi�re version jouable de notre jeu, il peut �tre sympa d�en faire profiter les 
# autres et de savoir ce qu�ils en pensent. En effet, quoi de plus normal que de vouloir que l�on joue � notre jeu et 
# l�am�liorer?? Avec Love2D, il existe plusieurs mani�res de distribuer son jeu.

# En cr�ant un fichier �?.love?�
# La plus simple consiste � cr�er un fichier �?.love?� qui pourra �tre ex�cut� sur les machines ayant une version compatible
# de Love2D d�install�e. Pour cela, il faut d�abord se placer dans le r�pertoire contenant tout notre jeu (code et ressources)
# et s�assurer que le fichier main.lua se trouve � la racine de celui-ci, sans quoi cela ne fonctionnera pas. Comme c�est 
# bon dans notre cas, nous pouvons s�lectionner tout le contenu puis le compresser en un fichier �?.zip?� (clique droit 
# puis compresser sous Ubuntu). Une fois cela fait, il ne reste plus qu�� renommer le fichier en rempla�ant l�extension par 
# �?love?�. L�ic�ne change et il est alors possible d�ex�cuter le jeu en double-cliquant sur le fichier.