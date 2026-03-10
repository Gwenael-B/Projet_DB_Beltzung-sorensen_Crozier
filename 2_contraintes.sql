/*Pour le modèle*/
-- Vérifier que le nom du modèle n'est pas vide
ALTER TABLE Modele
ADD CONSTRAINT CHK_Modele_nom_non_vide CHECK (Modele_nom <> '');

-- Vérifier que la version n'est pas vide
ALTER TABLE Modele
ADD CONSTRAINT CHK_Modele_version_non_vide CHECK (Modele_version <> '');


/*Pour  la catégorie*/
-- Vérifier que le nom de la catégorie n'est pas vide
ALTER TABLE Categorie
ADD CONSTRAINT CHK_Categorie_nom_non_vide CHECK (Categorie_nom <> '');

-- Empêcher les références circulaires dans la hiérarchie des catégories
ALTER TABLE Categorie
ADD CONSTRAINT CHK_Categorie_ID_1_différent CHECK (Categorie_ID_1 IS NULL OR Categorie_ID_1 <> Categorie_ID);


/*Pour le produit*/
-- Vérifier que le prix est positif ou nul si plus en vente
ALTER TABLE Produit
ADD CONSTRAINT CHK_Produit_prix_positif CHECK (Produit_prix >= 0);

-- Vérifier que le sexe est soit "Homme", "Femme", ou "Unisexe"
ALTER TABLE Produit
ADD CONSTRAINT CHK_Produit_sexe_valide CHECK (Produit_sexe IN ('Homme', 'Femme', 'Unisexe'));

-- Vérifier que la taille est non vide
ALTER TABLE Produit
ADD CONSTRAINT CHK_Produit_taille_non_vide CHECK (Produit_taille <> '');


/*Pour le short*/
-- Vérifier que l'indice UV est entre 0 et 50
ALTER TABLE Short
ADD CONSTRAINT CHK_Short_indice_UV_valide CHECK (Short_indice_UV BETWEEN 0 AND 50);

-- Vérifier que le nombre de poches est positif
ALTER TABLE Short
ADD CONSTRAINT CHK_Short_nb_poche_positif CHECK (Short_nb_poche >= 0);

-- Vérifier que la matière n'est pas vide
ALTER TABLE Short
ADD CONSTRAINT CHK_Short_matiere_non_vide CHECK (Short_matiere <> '');


/*Pour le t-shirt*/
-- Vérifier que l'indice UV est entre 0 et 50
ALTER TABLE T_shirt
ADD CONSTRAINT CHK_T_shirt_indice_UV_valide CHECK (T_shirt_indice_UV BETWEEN 0 AND 50);

-- Vérifier que la respirabilité est soit "Oui" ou "Non"
ALTER TABLE T_shirt
ADD CONSTRAINT CHK_T_shirt_respirabilite_valide CHECK (T_shirt_respirabilite IN ('Oui', 'Non', 'NR'));

-- Vérifier que l'imperméabilité est soit "Oui" ou "Non"
ALTER TABLE T_shirt
ADD CONSTRAINT CHK_T_shirt_impermeabilite_valide CHECK (T_shirt_impermeabilite IN ('Oui', 'Non', 'NR'));

-- Vérifier que les détails réfléchissants sont soit "Oui" ou "Non"
ALTER TABLE T_shirt
ADD CONSTRAINT CHK_T_shirt_details_reflechissants_valide CHECK (T_shirt_details_reflechissants IN ('Oui', 'Non', 'NR'));

-- Vérifier que la matière n'est pas vide
ALTER TABLE T_shirt
ADD CONSTRAINT CHK_T_shirt_matiere_non_vide CHECK (T_shirt_matiere <> '');


/*Pour les chaussures*/
-- Vérifier que la profondeur des crampons est positive
ALTER TABLE Chaussure
ADD CONSTRAINT CHK_Chaussure_profondeur_crampon_positif CHECK (Chaussure_profondeur_crampon > 0);

-- Vérifier que le drop est entre 0 et 50 mm
ALTER TABLE Chaussure
ADD CONSTRAINT CHK_Chaussure_drop_valide CHECK (Chaussure_drop BETWEEN 0 AND 50);

-- Vérifier que le poids est positif
ALTER TABLE Chaussure
ADD CONSTRAINT CHK_Chaussure_poids_positif CHECK (Chaussure_poids > 0);

-- Vérifier que le terrain est parmi les valeurs autorisées
ALTER TABLE Chaussure
ADD CONSTRAINT CHK_Chaussure_terrain_valide CHECK (Chaussure_terrain IN ('Route', 'Trail', 'Piste', 'Mixte', 'NR'));

-- Vérifier que le type de foulée est parmi les valeurs autorisées
ALTER TABLE Chaussure
ADD CONSTRAINT CHK_Chaussure_type_foulee_valide CHECK (Chaussure_type_foulee IN ('Neutre', 'Pronateur', 'Supinateur', 'NR'));

-- Vérifier que la distance est parmi les valeurs autorisées
ALTER TABLE Chaussure
ADD CONSTRAINT CHK_Chaussure_distance_valide CHECK (Chaussure_distance IN ('Courte', 'Moyenne', 'Longue', 'NR'));

-- Vérifier que le type de semelle est parmi les valeurs autorisées
ALTER TABLE Chaussure
ADD CONSTRAINT CHK_Chaussure_type_semelle_valide CHECK (Chaussure_type_semelle IN ('Souple', 'Rigide', 'Amortissante', 'NR'));

-- Vérifier que l'imperméabilité est soit "Oui" ou "Non"
ALTER TABLE Chaussure
ADD CONSTRAINT CHK_Chaussure_impermeabilite_valide CHECK (Chaussure_impermeabilite IN ('Oui', 'Non', 'NR'));
