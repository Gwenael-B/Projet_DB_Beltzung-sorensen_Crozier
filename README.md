# Shoes-data

1. Règles de gestion
Ces règles décrivent la réalité métier de notre catalogue. Elles permettront à l'étudiant de définir les entités, les associations et les contraintes d'intégrité.

Identité de Marque : Chaque article (chaussure, short ou t-shirt) est produit par une seule marque (ex : Nike, Asics). Une marque peut proposer plusieurs centaines
de références.

Classification des Produits : Un article appartient obligatoirement à une catégorie unique : Chaussure, Short ou T-shirt.

Généalogie des Modèles : Un modèle (ex : "Adizero") peut se décliner en plusieurs versions au fil des ans (v1, v2, v3). Chaque version est traitée comme
une entité distincte car ses caractéristiques techniques évoluent.

Spécificités Chaussures :

  Chaque chaussure est définie par son poids, son "drop" (différence de hauteur talon/avant-pied) et le type de mousse utilisé pour l'amorti.

  On doit préciser si elle contient une plaque de propulsion (carbone ou nylon).

  Elle est associée à un type de terrain (Route, Trail, Piste) et à une foulée (Neutre, Pronatrice, Supinatrice).

Spécificités Textile (Shorts et T-shirts) :

  Un vêtement est caractérisé par sa matière principale et sa coupe (Slim, Standard, Relax).

  Pour les shorts, on précise la longueur de l'entrejambe (souvent en pouces).

  On doit indiquer la présence de fonctionnalités spécifiques : nombre de poches, détails réfléchissants ou protection UV.

  Gestion des Tailles et Sexes : Chaque produit est conçu pour un sexe spécifique (Homme, Femme, Unisexe) et est disponible dans une gamme de tailles définie
(numérique pour les chaussures, alphabétique pour le textile).

  Technologies : Une marque utilise souvent des technologies brevetées (ex : Gore-Tex, Dri-FIT, FlyteFoam). Un produit peut intégrer une ou plusieurs de ces technologies.

Tarification : Nous conservons le prix de vente conseillé (PVC) à la sortie ainsi que le prix de vente actuel pratiqué dans notre catalogue.

2. Dictionnaire de données brutes
Ce tableau répertorie les données nécessaires sans préjuger de la manière dont elles seront organisées dans les tables finales.
Nom de la marque	Alphanumérique	50
Nom du modèle	Alphanumérique	100
Version du produit (ex: v2, 2026)	Alphanumérique	10
Sexe (H, F, U)	Alphanumérique	1
Poids de l'article (en grammes)	Entier	3
Drop de la chaussure (en mm)	Entier	2
Type de semelle (Plaque carbone, mousse)	Alphanumérique	15
Profondeur des crampons (trail)	Décimal	3,1
Surface de prédilection (Route, Trail...)	Alphanumérique	30
Type de foulée	Alphanumérique	20
Distance recommandée (10km, sprint, Marathon)	Alphanumérique	30
Matière textile principale	Alphanumérique	50
Taille (vêtement)	Alphanumérique	20
Nombre de poches	Entier	2
Présence de détails réfléchissants (T-shirt)	Booléen	1
Indice de protection UV (UPF)	Entier	2
Respirabilité (Échelle 1 à 5)	Entier	1
Imperméabilité (Oui/Non)	Booléen	1
Couleur principale	Alphanumérique	30
Prix de vente (€)	Décimal	6,2
