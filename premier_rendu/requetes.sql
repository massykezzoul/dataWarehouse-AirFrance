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

