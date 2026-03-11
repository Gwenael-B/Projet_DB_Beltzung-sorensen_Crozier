-- ==========================================================
-- INSERTION DES DONNÉES (RUNNING COMPARATOR)
-- ==========================================================

USE running_comparator;

-- 1. MARQUES (10)
INSERT INTO Marque (Marque_nom) VALUES 
('Nike'), ('Adidas'), ('Salomon'), ('Asics'), ('Puma'), 
('Hoka'), ('Brooks'), ('Mizuno'), ('New Balance'), ('Saucony');

-- 2. CATÉGORIES (Hiérarchie respectée)
INSERT INTO Categorie (Categorie_ID, Categorie_nom, Categorie_ID_1) VALUES 
(1, 'Chaussures', NULL),
(2, 'Vêtements', NULL),
(3, 'T-shirts', 2),
(4, 'Shorts', 2);

-- 3. MODÈLES (20)
-- Modele_ID, Version_ID (Unique), Nom, Marque_interne, Version, Marque_FK
INSERT INTO Modele (Modele_ID, Version_ID, Modele_nom, Modele_marque, Modele_version, Marque_nom) VALUES 
(1, 101, 'Pegasus', 'Running', '40', 'Nike'),
(2, 102, 'Ultraboost', 'Performance', '22', 'Adidas'),
(3, 103, 'Speedcross', 'Trail', '6', 'Salomon'),
(4, 104, 'Gel-Kayano', 'Road', '30', 'Asics'),
(5, 105, 'Clifton', 'Road', '9', 'Hoka'),
(6, 106, 'Ghost', 'Running', '15', 'Brooks'),
(7, 107, 'Fresh Foam 1080', 'Road', 'V12', 'New Balance'),
(8, 108, 'Wave Rider', 'Running', '27', 'Mizuno'),
(9, 109, 'Peregrine', 'Trail', '13', 'Saucony'),
(10, 110, 'Deviate Nitro', 'Elite', '2', 'Puma'),
(11, 111, 'Dri-FIT Miler', 'Apparel', 'V1', 'Nike'),
(12, 112, 'Own The Run', 'Apparel', 'V2', 'Adidas'),
(13, 113, 'Agile Tee', 'Mountain', 'V1', 'Salomon'),
(14, 114, 'Challenger', 'Shorts', '7in', 'Nike'),
(15, 115, 'Terrex Short', 'Trail Apparel', 'V3', 'Adidas'),
(16, 116, 'Sense Ride', 'Trail', '5', 'Salomon'),
(17, 117, 'Novablast', 'Road', '4', 'Asics'),
(18, 118, 'Endorphin Speed', 'Racing', '3', 'Saucony'),
(19, 119, 'Core 2-in-1', 'Training', 'V1', 'Puma'),
(20, 120, 'Accelerate', 'Apparel', 'V1', 'New Balance');

-- 4. PRODUITS (50)
-- 20 Chaussures (ID 1-20), 15 T-shirts (ID 21-35), 15 Shorts (ID 36-50)

-- Chaussures (Catégorie 1)
INSERT INTO Produit (Produit_ID, Produit_sexe, Produit_couleur, Produit_prix, Produit_taille, Categorie_ID, Modele_ID, Version_ID) VALUES 
(1, 'Homme', 'Bleu', 130.00, '42', 1, 1, 101), (2, 'Femme', 'Blanc', 130.00, '38', 1, 1, 101),
(3, 'Homme', 'Noir', 180.00, '43', 1, 2, 102), (4, 'Femme', 'Rose', 180.00, '39', 1, 2, 102),
(5, 'Unisexe', 'Vert', 140.00, '41', 1, 3, 103), (6, 'Homme', 'Gris', 190.00, '44', 1, 4, 104),
(7, 'Femme', 'Bleu ciel', 150.00, '37', 1, 5, 105), (8, 'Homme', 'Noir', 150.00, '42', 1, 6, 106),
(9, 'Femme', 'Corail', 170.00, '40', 1, 7, 107), (10, 'Homme', 'Bleu Marine', 160.00, '42', 1, 8, 108),
(11, 'Unisexe', 'Orange', 140.00, '43', 1, 9, 109), (12, 'Homme', 'Jaune', 160.00, '42', 1, 10, 110),
(13, 'Homme', 'Rouge', 140.00, '44', 1, 16, 116), (14, 'Femme', 'Violet', 140.00, '38', 1, 16, 116),
(15, 'Homme', 'Cyan', 150.00, '42', 1, 17, 117), (16, 'Femme', 'Blanc', 150.00, '39', 1, 17, 117),
(17, 'Homme', 'Noir', 200.00, '43', 1, 18, 118), (18, 'Femme', 'Rose', 200.00, '38', 1, 18, 118),
(19, 'Homme', 'Gris', 130.00, '41', 1, 1, 101), (20, 'Femme', 'Bleu', 180.00, '37', 1, 2, 102);

-- T-shirts (Catégorie 3)
INSERT INTO Produit (Produit_ID, Produit_sexe, Produit_couleur, Produit_prix, Produit_taille, Categorie_ID, Modele_ID, Version_ID) VALUES 
(21, 'Homme', 'Rouge', 30.00, 'M', 3, 11, 111), (22, 'Femme', 'Noir', 30.00, 'S', 3, 11, 111),
(23, 'Homme', 'Bleu', 35.00, 'L', 3, 12, 112), (24, 'Femme', 'Blanc', 35.00, 'M', 3, 12, 112),
(25, 'Unisexe', 'Gris', 40.00, 'L', 3, 13, 113), (26, 'Homme', 'Jaune', 25.00, 'XL', 3, 20, 120),
(27, 'Femme', 'Rose', 25.00, 'S', 3, 20, 120), (28, 'Homme', 'Vert', 30.00, 'M', 3, 11, 111),
(29, 'Femme', 'Bleu', 35.00, 'S', 3, 12, 112), (30, 'Homme', 'Orange', 40.00, 'M', 3, 13, 113),
(31, 'Femme', 'Noir', 30.00, 'L', 3, 11, 111), (32, 'Homme', 'Blanc', 35.00, 'S', 3, 12, 112),
(33, 'Unisexe', 'Gris', 40.00, 'M', 3, 13, 113), (34, 'Homme', 'Marine', 28.00, 'M', 3, 20, 120),
(35, 'Femme', 'Corail', 28.00, 'XS', 3, 20, 120);

-- Shorts (Catégorie 4)
INSERT INTO Produit (Produit_ID, Produit_sexe, Produit_couleur, Produit_prix, Produit_taille, Categorie_ID, Modele_ID, Version_ID) VALUES 
(36, 'Homme', 'Noir', 45.00, 'M', 4, 14, 114), (37, 'Femme', 'Noir', 45.00, 'S', 4, 14, 114),
(38, 'Homme', 'Bleu', 50.00, 'L', 4, 15, 115), (39, 'Femme', 'Gris', 50.00, 'M', 4, 15, 115),
(40, 'Homme', 'Noir', 35.00, 'M', 4, 19, 119), (41, 'Femme', 'Bleu', 35.00, 'S', 4, 19, 119),
(42, 'Unisexe', 'Rouge', 45.00, 'L', 4, 14, 114), (43, 'Homme', 'Marine', 55.00, 'M', 4, 15, 115),
(44, 'Femme', 'Rose', 30.00, 'S', 4, 19, 119), (45, 'Homme', 'Vert', 45.00, 'XL', 4, 14, 114),
(46, 'Femme', 'Anthracite', 50.00, 'M', 4, 15, 115), (47, 'Homme', 'Blanc', 35.00, 'L', 4, 19, 119),
(48, 'Homme', 'Noir', 40.00, 'M', 4, 14, 114), (49, 'Femme', 'Jaune', 40.00, 'S', 4, 15, 115),
(50, 'Unisexe', 'Orange', 35.00, 'M', 4, 19, 119);

-- 5. TABLES DE SPÉCIALISATION

-- CHAUSSURES (20 lignes)
INSERT INTO Chaussure (Chaussure_ID, Chaussure_profondeur_crampon, Chaussure_drop, Chaussure_poids, Chaussure_terrain, Chaussure_type_foulee, Chaussure_distance, Chaussure_type_semelle, Chaussure_impermeabilite, Produit_ID) VALUES 
(1, -1, 10, 280, 'Route', 'Neutre', 'Moyenne', 'Amortissante', 'Non', 1),
(2, -1, 10, 240, 'Route', 'Neutre', 'Moyenne', 'Amortissante', 'Non', 2),
(3, -1, 10, 310, 'Route', 'Neutre', 'Longue', 'Amortissante', 'Non', 3),
(4, -1, 10, 270, 'Route', 'Neutre', 'Longue', 'Amortissante', 'Non', 4),
(5, 5, 10, 300, 'Trail', 'Neutre', 'Longue', 'Rigide', 'Oui', 5),
(6, -1, 12, 300, 'Route', 'Pronateur', 'Longue', 'Amortissante', 'Non', 6),
(7, -1, 5, 210, 'Route', 'Neutre', 'Moyenne', 'Amortissante', 'Non', 7),
(8, -1, 12, 280, 'Route', 'Neutre', 'Moyenne', 'Souple', 'Non', 8),
(9, -1, 8, 250, 'Route', 'Neutre', 'Longue', 'Amortissante', 'Non', 9),
(10, -1, 12, 280, 'Route', 'Neutre', 'Moyenne', 'Amortissante', 'Non', 10),
(11, 4, 4, 260, 'Trail', 'Neutre', 'Longue', 'Rigide', 'Non', 11),
(12, -1, 6, 220, 'Route', 'Neutre', 'Courte', 'Amortissante', 'Non', 12),
(13, 4, 8, 290, 'Trail', 'Neutre', 'Moyenne', 'Amortissante', 'NR', 13),
(14, 4, 8, 250, 'Trail', 'Neutre', 'Moyenne', 'Amortissante', 'NR', 14),
(15, -1, 10, 260, 'Route', 'Neutre', 'Moyenne', 'Souple', 'Non', 15),
(16, -1, 10, 220, 'Route', 'Neutre', 'Moyenne', 'Souple', 'Non', 16),
(17, -1, 8, 210, 'Route', 'Neutre', 'Courte', 'Rigide', 'Non', 17),
(18, -1, 8, 180, 'Route', 'Neutre', 'Courte', 'Rigide', 'Non', 18),
(19, -1, 10, 280, 'Route', 'Neutre', 'Moyenne', 'Amortissante', 'Non', 19),
(20, -1, 10, 310, 'Route', 'Neutre', 'Longue', 'Amortissante', 'Non', 20);

-- T-SHIRTS (15 lignes)
INSERT INTO T_shirt (T_shirt_ID, T_shirt_matiere, T_shirt_indice_uv, T_shirt_respirabilite, T_shirt_impermeabilite, T_shirt_details_reflechissants, Produit_ID) VALUES 
(1, 'Polyester', 30, 'Oui', 'Non', 'Oui', 21), (2, 'Polyester', 30, 'Oui', 'Non', 'Oui', 22),
(3, 'Synthetique', -1, 'Oui', 'Non', 'Non', 23), (4, 'Synthetique', -1, 'Oui', 'Non', 'Non', 24),
(5, 'Laine Merinos', 50, 'Oui', 'Non', 'Non', 25), (6, 'Coton', -1, 'Non', 'Non', 'Non', 26),
(7, 'Coton', -1, 'Non', 'Non', 'Non', 27), (8, 'Polyester', 20, 'Oui', 'Non', 'Oui', 28),
(9, 'Synthetique', -1, 'Oui', 'Non', 'Non', 29), (10, 'Mesh', 15, 'Oui', 'Non', 'Oui', 30),
(11, 'Polyester', 30, 'Oui', 'Non', 'NR', 31), (12, 'Synthetique', -1, 'Oui', 'Non', 'Oui', 32),
(13, 'Laine Merinos', 50, 'Oui', 'Non', 'NR', 33), (14, 'Polyester', -1, 'NR', 'Non', 'Non', 34),
(15, 'Coton', -1, 'Non', 'Non', 'NR', 35);

-- SHORTS (15 lignes)
INSERT INTO Short (Short_ID, Short_indice_uv, Short_nb_poche, Short_matiere, Produit_ID) VALUES 
(1, -1, 1, 'Synthetique', 36), (2, -1, 1, 'Synthetique', 37),
(3, 40, 2, 'Polyester', 38), (4, 40, 2, 'Polyester', 39),
(5, -1, 1, 'Mesh', 40), (6, -1, 1, 'Mesh', 41),
(7, 50, 3, 'Polyester', 42), (8, 45, 4, 'Technique', 43),
(9, -1, 0, 'Synthetique', 44), (10, 20, 2, 'Polyester', 45),
(11, 20, 2, 'Polyester', 46), (12, -1, 1, 'Mesh', 47),
(13, -1, 1, 'Synthetique', 48), (14, 40, 2, 'Polyester', 49),
(15, 15, 2, 'Mesh', 50);
