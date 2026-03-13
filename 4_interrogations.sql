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

--Prix moyen par poids de chaussures
SELECT 
    C.Chaussure_poids AS Poids_en_grammes, 
    ROUND(AVG(P.Produit_prix), 2) AS Prix_Moyen
FROM Chaussure C
JOIN Produit P ON C.Produit_ID = P.Produit_ID
GROUP BY C.Chaussure_poids
ORDER BY C.Chaussure_poids ASC;

--Prix total et nombre de chaussures par modèle
SELECT 
    M.Modele_nom, 
    COUNT(C.Chaussure_ID) AS Nombre_de_Chaussures, 
    SUM(P.Produit_prix) AS Valeur_Totale_Stock
FROM Modele M
JOIN Produit P ON M.Modele_ID = P.Modele_ID
JOIN Chaussure C ON P.Produit_ID = C.Produit_ID
GROUP BY M.Modele_nom
ORDER BY Valeur_Totale_Stock DESC;

--Partie 3 : jointures internes, externes, simples, multiples
--Détails des différents t-shirt avec leur nom de modèle et leur matière
SELECT M.Modele_nom, CAT.Categorie_nom, T.T_shirt_matiere
FROM T_shirt T
JOIN Produit P ON T.Produit_ID = P.Produit_ID
JOIN Modele M ON P.Modele_ID = M.Modele_ID
JOIN Categorie CAT ON P.Categorie_ID = CAT.Categorie_ID;

--Liste de tous les modèles avec la marque, la catégorie et le prix
SELECT M.Modele_nom, MAR.Marque_nom, C.Categorie_nom, P.Produit_prix
FROM Produit P
JOIN Modele M ON P.Modele_ID = M.Modele_ID
JOIN Marque MAR ON M.Marque_nom = MAR.Marque_nom
JOIN Categorie C ON P.Categorie_ID = C.Categorie_ID;

--Liste complète des caractéristiques de toutes les chaussures
SELECT M.Modele_nom, CH.Chaussure_terrain, CH.Chaussure_poids, CH.Chaussure_drop, CH.Chaussure_type_foulee, CH.Chaussure_profondeur_crampon, CH.Chaussure_distance,CH.Chaussure_type_semelle,CH.Chaussure_impermeabilite
FROM Chaussure CH
JOIN Produit P ON CH.Produit_ID = P.Produit_ID
JOIN Modele M ON P.Modele_ID = M.Modele_ID;


--Partie 4 :  requêtes imbriquées
--Liste des modèles dont le prix est supérieur à la moyenne des prix
SELECT DISTINCT M.Modele_nom, P.Produit_prix
FROM Modele M
JOIN Produit P ON M.Modele_ID = P.Modele_ID
WHERE P.Produit_prix > (SELECT AVG(Produit_prix) FROM Produit);

--Liste des modèles des catégories t-shirts et shorts
SELECT Modele_nom 
FROM Modele 
WHERE Modele_ID IN (
    SELECT Modele_ID FROM Produit WHERE Categorie_ID IN (
        SELECT Categorie_ID FROM Categorie WHERE Categorie_nom IN ('T-shirts', 'Shorts')
    )
);

--Liste des modèles qui sont des shorts
SELECT Modele_nom 
FROM Modele 
WHERE Modele_ID IN (
    SELECT Modele_ID 
    FROM Produit 
    WHERE Categorie_ID = (SELECT Categorie_ID FROM Categorie WHERE Categorie_nom = 'Shorts')
);

--Liste des modèles de chaussures qui sont plus lourdes que les chaussures de route
SELECT DISTINCT M.Modele_nom
FROM Modele M
JOIN Produit P ON M.Modele_ID = P.Modele_ID
JOIN Chaussure C ON P.Produit_ID = C.Produit_ID
WHERE C.Chaussure_poids > ALL (
    SELECT Chaussure_poids FROM Chaussure WHERE Chaussure_terrain = 'Route'
);

--Liste des modèles qui sont moins chère que n'importe quelle chaussure Salomon
SELECT DISTINCT M.Modele_nom
FROM Modele M
JOIN Produit P ON M.Modele_ID = P.Modele_ID
WHERE P.Produit_prix < ANY (
    SELECT P2.Produit_prix 
    FROM Produit P2 
    JOIN Modele M2 ON P2.Modele_ID = M2.Modele_ID 
    WHERE M2.Marque_nom = 'Salomon'
);

