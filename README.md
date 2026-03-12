# Shoes-data

## 1. Règles de gestion :
Ces règles décrivent la réalité métier de notre catalogue. Elles permettront à l'étudiant de définir les entités, les associations et les contraintes d'intégrité.

__Identité de Marque :__ Chaque article (chaussure, short ou t-shirt) est produit par une seule marque (ex : Nike, Asics). Une marque peut proposer plusieurs centaines
de références.

___Classification des Produits :__ Un article appartient obligatoirement à une catégorie unique : Chaussure, Short ou T-shirt.

__Généalogie des Modèles :__ Un modèle (ex : "Adizero") peut se décliner en plusieurs versions au fil des ans (v1, v2, v3). Chaque version est traitée comme
une entité distincte car ses caractéristiques techniques évoluent.

__Spécificités Chaussures :__

  Chaque chaussure est définie par son poids, son "drop" (différence de hauteur talon/avant-pied) et le type de mousse utilisé pour l'amorti.

  On doit préciser si elle contient une plaque de propulsion (carbone ou nylon).

  Elle est associée à un type de terrain (Route, Trail, Piste) et à une foulée (Neutre, Pronatrice, Supinatrice).

__Spécificités Textile (Shorts et T-shirts) :__

  Un vêtement est caractérisé par sa matière principale et sa coupe (Slim, Standard, Relax).

  Pour les shorts, on précise la longueur de l'entrejambe (souvent en pouces).

  On doit indiquer la présence de fonctionnalités spécifiques : nombre de poches, détails réfléchissants ou protection UV.

__Gestion des Tailles et Sexes :__ Chaque produit est conçu pour un sexe spécifique (Homme, Femme, Unisexe) et est disponible dans une gamme de tailles définie
(numérique pour les chaussures, alphabétique pour le textile).

__Technologies :__ Une marque utilise souvent des technologies brevetées (ex : Gore-Tex, Dri-FIT, FlyteFoam). Un produit peut intégrer une ou plusieurs de ces technologies.

__Tarification :__ Nous conservons le prix de vente conseillé (PVC) à la sortie ainsi que le prix de vente actuel pratiqué dans notre catalogue.

## 2. Dictionnaire de données brutes
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

Modèle conceptuel de données :
<img width="1401" height="718" alt="image" src="https://github.com/user-attachments/assets/1b009aa3-c736-497d-b62b-149c38647421" />

Modèle logique de données :
<img width="1371" height="740" alt="image" src="https://github.com/user-attachments/assets/c8970d9b-0c44-49f4-ab65-28e572b47feb" />

Prompt pour la génération de données pour la base de données :
Donne les requêtes d’insertion permettant de remplir la base de données dont le modèle relationnel est le suivant : 
•	Marque (Marque_nom) ; Clé primaire : Marque_nom. 
•	Modèle (Modèle_ID, Version_ID, Modèle_nom, Modèle_marque, Version, #Marque_nom) ; Clé primaire : (Modèle_ID, Version_ID). 
•	Catégorie (Catégorie_ID, Catégorie_nom, #Parent_Catégorie_ID) ; Clé primaire : Catégorie_ID. 
•	Produit (Produit_ID, Produit_sexe, Produit_couleur, Produit_prix, Produit_taille, #Modèle_ID, #Version_ID, #Catégorie_ID) ; Clé primaire : Produit_ID. 
•	Short (Short_ID, Short_indice_UV, Short_nb_poche, Short_matière, #Produit_ID) ; Clé primaire : Short_ID. 
•	T-shirt (T-shirt_ID, T-shirt_matière, T-shirt_indice_UV, T-shirt_respirabilité, T-shirt_imperméabilité, T-shirt_détails_réfléchissants, #Produit_ID) ; Clé primaire : T-shirt_ID. 
•	Chaussure (Chaussure_ID, Chaussure_profondeur_crampon, Chaussure_drop, Chaussure_poids, Chaussure_terrain, Chaussure_type_foulée, Chaussure_distance, Chaussure_type_semelle, Chaussure_imperméabilité, #Produit_ID) ; Clé primaire : Chaussure_ID.
Les clés primaires correspondent aux id, sauf si autre chose est précisé (quand c'est un attribut composé) les clés étrangères sont identifiées par les #, et ont le même nom que les clés primaires auxquelles elles font référence. Quand tu n’as pas les informations pour la profondeur de crampon mets -1, de même pour l’indice UV. Pour le sexe il doit être Homme ou Femme ou Unisexe.
Génère environ 10 marques de sport réalistes (ex : Nike, Adidas, Salomon, etc.). Génère 20 modèles et au moins 50 produits répartis entre les catégories Short, T-shirt et Chaussure.
Les clés étrangères doivent faire référence aux clés primaires existantes : donne les lignes en commençant par remplir les tables dans lesquelles il n'y a pas de clés étrangères, puis les tables dans lesquelles les clés étrangères font références à des clés primaires des tables déjà remplies. 
Fournis l'ensemble sous la forme d’un script SQL prêt à être exécuté.

Scénario d'utilisation : Vous êtes responsable du catalogue de Running Comparator, un site en ligne spécialisé dans le matériel de course à pied, plus précisément les shorts t-shirts et chaussures. Votre rôle est de vendre la base de données du site pour des magasins de vente multimarques afin que leurs vendeurs puissent conseiller au mieux les clients. Avec toutes les caractéristiques de chaque vêtement ou de chaque chaussure, les vendeur pourront trier et sélectionner les produits qui correspondent le mieux aux attentes des clients.
