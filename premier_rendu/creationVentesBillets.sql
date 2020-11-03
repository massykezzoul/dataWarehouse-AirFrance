DROP TABLE ventes_billets;
DROP TABLE dimension_aereport;
DROP TABLE dimension_vol;
DROP TABLE dimension_heureJour;
DROP TABLE dimension_date;








CREATE TABLE dimension_date
(
    id NUMBER(5) PRIMARY KEY,
    format_date VARCHAR2(20),
    jour_de_semaine NUMBER(1) CHECK  (jour_de_semaine IN (1,2,3,4,5,6,7)),
    num_jour NUMBER(2) CHECK (num_jour BETWEEN 1 AND 31),
    num_mois NUMBER(2) CHECK (num_mois BETWEEN 1 AND 12),
    num_semaine NUMBER(2),
    num_annee NUMBER(4),
    num_trimestre NUMBER(1) CHECK (num_trimestre IN (1,2,3,4)),
    num_semestre NUMBER(1) CHECK (num_semestre IN (1,2)),
    nom_jour VARCHAR2(8), 
    nom_mois VARCHAR2(10),
    annee_mois VARCHAR2(7),
    indicateur_jour_ferie VARCHAR2(9) CHECK (indicateur_jour_ferie IN ("férié","non férié")),
    indicateur_jour_de_semaine VARCHAR2(15) CHECK (indicateur_jour_de_semaine IN ("weekend","jour de semaine")),
    date_sql date,
    evenement_majeur VARCHAR2(30)
 
);
CREATE TABLE dimension_heureJour
(
    id NUMBER(5) PRIMARY KEY,
    heure_jour NUMBER(2) NOT NULL,
    minute_heure NUMBER(2) NOT NULL, 
    fuseau_horaire VARCHAR2(5) NOT NULL, 
    format_heure VARCHAR2(5),
    format_heure_anglaise VARCHAR2(8)
);

CREATE TABLE dimension_vol
(
    id NUMBER(5) PRIMARY KEY,
    num_vol NUMBER(10) NOT NULL,
    num_avion VARCHAR2(10),
    capacite NUMBER(3),
    cout_vol_euro NUMBER(8),
    cout_vol_dollar NUMBER(8),
    cout_vol_livre_sterling NUMBER(8),
    estimation_carburant NUMBER(5),
    km_a_parcourir NUMBER(5),
    nb_places_classe_affaire NUMBER(3),
    nb_places_sec_classe NUMBER(3),
    charge_max_en_soute NUMBER(5),
    charge_enregistre_en_soute NUMBER(5)
);

CREATE TABLE dimension_aereport
(
    id NUMBER(5) PRIMARY KEY,
    ville VARCHAR2(20) NOT NULL,    
    pays VARCHAR2(20) NOT NULL,
    num_rue NUMBER(3) NOT NULL,
    nom_rue VARCHAR2(20) NOT NULL,
    code_postal NUMBER(5) NOT NULL,
    nom_aereport VARCHAR2(20) NOT NULL,
    type_aereport VARCHAR2(20),
    transport_commerciale VARCHAR2(3) CHECK (transport_commerciale IN ("oui","non")),
    transport_feret VARCHAR2(3) CHECK (transport_feret IN ("oui","non")),
    categorie VARCHAR2(20),
    nb_piste NUMBER(5),
    nb_place_stationnement NUMBER(5)
);













CREATE TABLE ventes_billets 
(
    date_depart NUMBER(5) FOREIGN KEY REFERENCES dimension_date(id),
    date_arrivee NUMBER(5) FOREIGN KEY REFERENCES dimension_date(id),
    heure_depart NUMBER(5) FOREIGN KEY REFERENCES dimension_heureJour(id),
    heure_arrivee NUMBER(5) FOREIGN KEY REFERENCES dimension_heureJour(id),
    aereport_depart NUMBER(5) FOREIGN KEY REFERENCES dimension_aereport(id),
    aereport_arrivee NUMBER(5) FOREIGN KEY REFERENCES dimension_aereport(id),
    num_vol NUMBER(5) FOREIGN KEY REFERENCES dimension_vol(id),
    prix_billet NUMBER(4),
    type_billet VARCHAR2(20),
    poids_autorise NUMBER(5),
    poids_enregistre NUMBER(5),
);