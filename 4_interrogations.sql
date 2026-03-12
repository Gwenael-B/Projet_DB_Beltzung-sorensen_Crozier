--Partie 1 : projections et sélections avec tri
--Liste des couleurs uniques par nom de modèle
SELECT DISTINCT M.Modele_nom, P.Produit_couleur 
FROM Produit P
JOIN Modele M ON P.Modele_ID = M.Modele_ID
ORDER BY M.Modele_nom;

--Liste des modèles qui contiennent "Nitro" ou "Speed" dans leur nom triés par prix
SELECT M.Modele_nom, P.Produit_prix 
FROM Produit P
JOIN Modele M ON P.Modele_ID = M.Modele_ID
WHERE M.Modele_nom LIKE '%Speed%' OR M.Modele_nom LIKE '%Nitro%';

--Modèles dont le prix est entre 130€ et 160€
SELECT DISTINCT M.Modele_nom, P.Produit_prix 
FROM Produit P
JOIN Modele M ON P.Modele_ID = M.Modele_ID
WHERE P.Produit_prix BETWEEN 130 AND 160
ORDER BY P.Produit_prix ASC;

--Liste des modèles qui viennent des marques Nike, Adidas et Salomon
SELECT Modele_nom, Modele_version, Marque_nom 
FROM Modele 
WHERE Marque_nom IN ('Nike', 'Adidas', 'Salomon');

--Sélection des modèles Femme en taille 38
SELECT M.Modele_nom, P.Produit_couleur, P.Produit_prix, P.Produit_taille
FROM Produit P
JOIN Modele M ON P.Modele_ID = M.Modele_ID
WHERE P.Produit_sexe = 'Femme' AND P.Produit_taille = '38';

--Partie 2 :  fonctions d’agrégation permettant de calculer des statistiques
--Nombre de variantes de couleurs par modèle trié par ordre décroissant
SELECT M.Modele_nom, COUNT(DISTINCT P.Produit_couleur) AS Nb_Couleurs
FROM Produit P
JOIN Modele M ON P.Modele_ID = M.Modele_ID
GROUP BY M.Modele_nom
ORDER BY nb_couleurs desc;

--Modèles ayant plus de 2 tailles différentes en stock, on affiche le nombre de modèles
SELECT M.Modele_nom, COUNT(P.Produit_taille) AS Total_Stock
FROM Produit P
JOIN Modele M ON P.Modele_ID = M.Modele_ID
GROUP BY M.Modele_nom
HAVING COUNT(P.Produit_taille) > 2;

--Prix total du stock pour le modèle "Pegasus"
SELECT M.Modele_nom, SUM(P.Produit_prix) AS Valeur_Inventaire
FROM Produit P
JOIN Modele M ON P.Modele_ID = M.Modele_ID
WHERE M.Modele_nom = 'Pegasus';


--Partie 3 : jointures internes, externes, simples, multiples
--Détails des différents t-shirt avec leur nom de modèle et leur matière
SELECT M.Modele_nom, CAT.Categorie_nom, T.T_shirt_matiere
FROM T_shirt T
JOIN Produit P ON T.Produit_ID = P.Produit_ID
JOIN Modele M ON P.Modele_ID = M.Modele_ID
JOIN Categorie CAT ON P.Categorie_ID = CAT.Categorie_ID;



--Partie 4 :  requêtes imbriquées

