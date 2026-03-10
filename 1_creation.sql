CREATE DATABASE running_comparator;

USE running_comparator;

CREATE TABLE Marque (
    Marque_nom VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Modele (
    Modele_ID INT PRIMARY KEY,
    Version_ID INT UNIQUE,
    Modele_nom VARCHAR(50),
    Modele_marque VARCHAR(50),
    Modele_version VARCHAR(50),
    Marque_nom VARCHAR(50),
    FOREIGN KEY (Marque_nom) REFERENCES Marque(Marque_nom)
);

CREATE TABLE Categorie (
    Categorie_ID INT PRIMARY KEY,
    Categorie_nom VARCHAR(50),
    Categorie_ID_1 INT
);

ALTER TABLE categorie ADD CONSTRAINT Categorie_ID_1 FOREIGN KEY (Categorie_ID_1) REFERENCES Categorie(Categorie_ID);

CREATE TABLE Produit (
    Produit_ID INT PRIMARY KEY,
    Produit_sexe VARCHAR(50),
    Produit_couleur VARCHAR(50),
    Produit_prix DECIMAL(10, 2),
    Produit_taille VARCHAR(50),
    Categorie_ID INT,
    Modele_ID INT,
    Version_ID INT,
    FOREIGN KEY (Categorie_ID) REFERENCES Categorie(Categorie_ID),
    FOREIGN KEY (Modele_ID) REFERENCES Modele(Modele_ID),
    FOREIGN KEY (Version_ID) REFERENCES Modele(Version_ID)
);

CREATE TABLE Short (
    Short_ID INT PRIMARY KEY,
    Short_indice_UV INT,
    Short_nb_poche INT,
    Short_matiere VARCHAR(50),
    Produit_ID INT,
    FOREIGN KEY (Produit_ID) REFERENCES Produit(Produit_ID)
);

CREATE TABLE T_shirt (
    T_shirt_ID INT PRIMARY KEY,
    T_shirt_matiere VARCHAR(50),
    T_shirt_indice_UV INT,
    T_shirt_respirabilite VARCHAR(50),
    T_shirt_impermeabilite VARCHAR(50),
    T_shirt_details_reflechissants VARCHAR(50),
    Produit_ID INT,
    FOREIGN KEY (Produit_ID) REFERENCES Produit(Produit_ID)
);

CREATE TABLE Chaussure (
    Chaussure_ID INT PRIMARY KEY,
    Chaussure_profondeur_crampon INT,
    Chaussure_drop INT,
    Chaussure_poids DECIMAL(10, 2),
    Chaussure_terrain VARCHAR(50),
    Chaussure_type_foulee VARCHAR(50),
    Chaussure_distance VARCHAR(50),
    Chaussure_type_semelle VARCHAR(50),
    Chaussure_impermeabilite VARCHAR(50),
    Produit_ID INT,
    FOREIGN KEY (Produit_ID) REFERENCES Produit(Produit_ID)
);
