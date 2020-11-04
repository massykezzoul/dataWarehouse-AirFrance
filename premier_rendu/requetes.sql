/* R1 
    la demande vers une destination donnée dans une pèriode donnée 
*/
SELECT count(*) AS nb_billet_destination_periode
FROM ventes_billets, dimension_aeroport, dimension_date
WHERE dimension_date.id = ventes_billets.date_depart 
AND dimension_aeroport.id = ventes_billets.aeroport_arrivee
AND num_annee = 2019 
AND ville = 'Montpellier';

/* R2 
    nombre de billtes enregistrés par vol 
*/

SELECT num_vol,count(*) as nb_billets_vol
FROM ventes_billets, dimension_vol
WHERE dimension_vol.id = ventes_billets.num_vol
GROUP BY ventes_billets.num_vol;

/* R3 
    avoir la tranche d'age de chaque client pour un vol donné
*/

SELECT tranche_age
FROM ventes_billets, dimension_client
WHERE ventes_billets.num_client = dimension_client.id 
AND num_vol = 1;

/* R4 
    nombre de billtes enregistrés par client (pour faire une fidelité a ce client)
*/
SELECT num_client,count(*) as nb_billets_vol
FROM ventes_billets, dimension_client
WHERE dimension_client.id = ventes_billets.num_client
GROUP BY ventes_billets.num_client;

/* R5
    avoir la tranche d'age de chaque client pour une destination donnée
*/
SELECT tranche_age
FROM ventes_billets, dimension_client,dimension_aeroport
WHERE ventes_billets.num_client = dimension_client.id 
AND dimension_aeroport.id = ventes_billets.aeroport_arrivee
AND ville = 'Montpellier';

/* R6
    le nombre de clients qui n'ont pas une carte fidelité 
*/

SELECT count(*) as nb_client 
FROM ventes_billets,dimension_client
WHERE ventes_billets.num_client = dimension_client.id
AND fidelite = 'non';


/* R7
     le nombre de  clients qui ont  une carte fidelité 
*/


SELECT count(*) as nb_client 
FROM ventes_billets,dimension_client
WHERE ventes_billets.num_client = dimension_client.id
AND fidelite = 'oui';

/* R8
    Calculer la rentabilité de chaque avion
 */
SELECT a.nom_avion , s.recette - s.carburant_consomme * a.prix_carburant
FROM dimension_avions a, stock_avions s
WHERE s.num_avion = a.id
GROUP BY s.num_avion;

/* R9
    Calculer la moyenne de carburant consommé par avion par KM parcouru et la comparé avec la conso théorique
 */
SELECT a.nom_avion , AVG(s.carburant_consomme / s.nombre_km), a.conso_par_km
FROM dimension_avions a, stock_avions s
WHERE s.num_avion = a.id
GROUP BY s.num_avion, s.date_jour;

/* R10
    Calculer la moyenne du coût par vol pour chaque avion
 */
SELECT a.nom_avion , s.carburant_consomme * a.prix_carburant / nombre_vol
FROM dimension_avions a, stock_avions stock_avions
WHERE s.num_avion = a.id
GROUP BY s.num_avion;