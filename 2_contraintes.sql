/* --- TABLE MODELE --- */
ALTER TABLE Modele
ADD CONSTRAINT CHK_Modele_nom_non_vide CHECK (Modele_nom <> ''),
ADD CONSTRAINT CHK_Modele_version_non_vide CHECK (Modele_version <> '');


/* --- TABLE CATEGORIE --- */
ALTER TABLE Categorie
ADD CONSTRAINT CHK_Categorie_nom_non_vide CHECK (Categorie_nom <> '');

ALTER TABLE Categorie
ADD CONSTRAINT CHK_Categorie_pas_auto_parent CHECK (Categorie_ID_1 IS NULL OR Categorie_ID_1 <> Categorie_ID);


/* --- TABLE PRODUIT --- */
ALTER TABLE Produit
ADD CONSTRAINT CHK_Produit_prix_positif CHECK (Produit_prix >= 0),
ADD CONSTRAINT CHK_Produit_sexe_valide CHECK (Produit_sexe IN ('Homme', 'Femme', 'Unisexe')),
ADD CONSTRAINT CHK_Produit_taille_non_vide CHECK (Produit_taille <> '');


/* --- TABLE SHORT --- */
ALTER TABLE Short
ADD CONSTRAINT CHK_Short_indice_UV_valide CHECK (Short_indice_UV BETWEEN -1 AND 50),
ADD CONSTRAINT CHK_Short_nb_poche_positif CHECK (Short_nb_poche >= 0),
ADD CONSTRAINT CHK_Short_matiere_non_vide CHECK (Short_matiere <> '');


/* --- TABLE T_SHIRT --- */
ALTER TABLE T_shirt
ADD CONSTRAINT CHK_T_shirt_indice_UV_valide CHECK (T_shirt_indice_UV BETWEEN -1 AND 50),
ADD CONSTRAINT CHK_T_shirt_respirabilite_valide CHECK (T_shirt_respirabilite IN ('Oui', 'Non', 'NR')),
ADD CONSTRAINT CHK_T_shirt_impermeabilite_valide CHECK (T_shirt_impermeabilite IN ('Oui', 'Non', 'NR')),
ADD CONSTRAINT CHK_T_shirt_details_reflechissants_valide CHECK (T_shirt_details_reflechissants IN ('Oui', 'Non', 'NR')),
ADD CONSTRAINT CHK_T_shirt_matiere_non_vide CHECK (T_shirt_matiere <> '');


/* --- TABLE CHAUSSURE --- */
ALTER TABLE Chaussure
ADD CONSTRAINT CHK_Chaussure_profondeur_crampon_valide CHECK (Chaussure_profondeur_crampon >= -1),
ADD CONSTRAINT CHK_Chaussure_drop_valide CHECK (Chaussure_drop BETWEEN 0 AND 50),
ADD CONSTRAINT CHK_Chaussure_poids_positif CHECK (Chaussure_poids > 0),
ADD CONSTRAINT CHK_Chaussure_terrain_valide CHECK (Chaussure_terrain IN ('Route', 'Trail', 'Piste', 'Mixte', 'NR')),
ADD CONSTRAINT CHK_Chaussure_type_foulee_valide CHECK (Chaussure_type_foulee IN ('Neutre', 'Pronateur', 'Supinateur', 'NR')),
ADD CONSTRAINT CHK_Chaussure_distance_valide CHECK (Chaussure_distance IN ('Courte', 'Moyenne', 'Longue', 'NR')),
ADD CONSTRAINT CHK_Chaussure_type_semelle_valide CHECK (Chaussure_type_semelle IN ('Souple', 'Rigide', 'Amortissante', 'NR')),
ADD CONSTRAINT CHK_Chaussure_impermeabilite_valide CHECK (Chaussure_impermeabilite IN ('Oui', 'Non', 'NR'));
