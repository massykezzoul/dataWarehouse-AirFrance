DROP TABLE ventes_billets;
DROP TABLE dimension_aereport;
DROP TABLE dimension_vol;
DROP TABLE dimension_avion;
DROP TABLE dimension_heureJour;
DROP TABLE dimension_date;



CREATE TABLE dimension_date
(
    id NUMBER(5) PRIMARY KEY AUTO_INCREMENT,
    format_date VARCHAR2(20),
    jour_de_semaine NUMBER(1) CHECK(jour_de_semaine IN (1,2,3,4,5,6,7)),
    num_jour NUMBER(2) CHECK(num_jour BETWEEN 1 AND 31),
    num_mois NUMBER(2) CHECK(num_mois BETWEEN 1 AND 12),
    num_semaine NUMBER(2),
    num_annee NUMBER(4),
    num_trimestre NUMBER(1) CHECK(num_trimestre IN (1,2,3,4)),
    num_semestre NUMBER(1) CHECK(num_semestre IN (1,2)),
    nom_jour VARCHAR2(8), 
    nom_mois VARCHAR2(10),
    annee_mois VARCHAR2(7),
    indicateur_jour_ferie VARCHAR2(10) CHECK(indicateur_jour_ferie IN ('ferie','nonferie')),
    indicateur_jour_de_semaine VARCHAR2(15) CHECK(indicateur_jour_de_semaine IN ('weekend','jour de semaine')),
    date_sql date,
    evenement_majeur VARCHAR2(30)
);
CREATE TABLE dimension_heureJour
(
    id NUMBER(5) PRIMARY KEY AUTO_INCREMENT,
    heure_jour NUMBER(2) NOT NULL,
    minute_heure NUMBER(2) NOT NULL, 
    fuseau_horaire VARCHAR2(5) NOT NULL, 
    format_heure VARCHAR2(5),
    format_heure_anglaise VARCHAR2(8)
);
CREATE TABLE dimension_avion 
(
    id NUMBER(5) PRIMARY KEY AUTO_INCREMENT,
    nom_avion VARCHAR2(10) NOT NULL,
    capacite NUMBER(5),
    conso_par_km NUMBER(5),
    reservoir_carburant NUMBER(4),
    type_carburant VARCHAR2(20),
    impact_envorinnement VARCHAR2(20),
    classe_avion VARCHAR2(20),
    vitesse_max NUMBER(4),
    vitesse_min NUMBER(4),
    attitude_max NUMBER(5),
    charge_max_totale NUMBER(6),
    charge_en_soute NUMBER(5)
);

CREATE TABLE dimension_vol
(
    id NUMBER(5) PRIMARY KEY AUTO_INCREMENT,
    num_vol NUMBER(10) NOT NULL,
    num_avion NUMBER(5), 
    FOREIGN KEY(num_avion) REFERENCES dimension_avion(id),
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

CREATE TABLE dimension_client
(
    id NUMBER(5) PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR2(20),
    prenom VARCHAR2(20),
    date_naissance date,
    age NUMBER(3),
    tranche_age VARCHAR2(20) CHECK (tranche_age IN ('0-18','19-26','26-40','41+')),
    nationalite VARCHAR2(20),
    fidelite VARCHAR2(3) CHECK (fidelite IN ('oui','non')
);


CREATE TABLE dimension_aereport
(
    id NUMBER(5) PRIMARY KEY AUTO_INCREMENT,
    ville VARCHAR2(20) NOT NULL,    
    pays VARCHAR2(20) NOT NULL,
    num_rue NUMBER(3) NOT NULL,
    nom_rue VARCHAR2(20) NOT NULL,
    code_postal NUMBER(5) NOT NULL,
    nom_aereport VARCHAR2(20) NOT NULL,
    type_aereport VARCHAR2(20),
    transport_commerciale VARCHAR2(3) CHECK (transport_commerciale IN ('oui','non')),
    transport_feret VARCHAR2(3) CHECK (transport_feret IN ('oui','non')),
    categorie VARCHAR2(20),
    nb_piste NUMBER(5),
    nb_place_stationnement NUMBER(5)
);


CREATE TABLE ventes_billets 
(
    date_depart NUMBER(5),
    FOREIGN KEY(date_depart) REFERENCES dimension_date(id),
    date_arrivee NUMBER(5),
    FOREIGN KEY(date_arrivee) REFERENCES dimension_date(id),
    heure_depart NUMBER(5),
    FOREIGN KEY(heure_depart) REFERENCES dimension_heureJour(id),
    heure_arrivee NUMBER(5),
    FOREIGN KEY(heure_arrivee) REFERENCES dimension_heureJour(id),
    aereport_depart NUMBER(5),
    FOREIGN KEY(aereport_depart) REFERENCES dimension_aereport(id),
    aereport_arrivee NUMBER(5),
    FOREIGN KEY(aereport_arrivee) REFERENCES dimension_aereport(id),
    num_vol NUMBER(5),
    FOREIGN KEY(num_vol) REFERENCES dimension_vol(id),
    num_client NUMBER(5),
    FOREIGN KEY(num_client) REFERENCES dimension_client(id),
    prix_billet NUMBER(4),
    type_billet VARCHAR2(20),
    poids_autorise NUMBER(5),
    poids_enregistre NUMBER(5)
);