# Entrepôt de données Air France

L’objectif du projet est de concevoir, implémenter et interroger un entrepôt de données permettant à une entreprises d’améliorer sa position dans le marché. L'entreprise considérée ici est [Air France](https://wwws.airfrance.fr/).

## Structuration du depôt

Le code source pour la création de l'entrepôt est sous le dossier [`src/`](./src/). Plus d'informations sur la modélisation sont décrites dans [le rapport](./doc/rapport.pdf) de projet.

## Analyse du cas

### Objectif de l'entreprise

Le premier objectif d’Air Fance est de développer son réseau, de développer ses possibilités de destinations tout en réduisant les coûts. Au même temps assurer une prestation de service de haute qualitée.

#### Revenu :

- Ventes de billet;
- Ventes de services à bords de l'avion;
- Transport de personnes;
- Transport de marchandise;
- Maintenance aéronautique

#### Dépenses :

- Carburant, 
- le coût de l’équipage, 
- la maintenance de l'avion,
- L'achat de nouveaux avions...

Comme toute entreprise, l'objectif sera de maximiser les revenus tout en minimisant les dépenses.

#### Quelques chiffres d'Air France:

- 104 Millions de passagers en 2019
- 200 clients internationaux (maintenance)
- 391 destination (activité cargot)
- 302 avions en 2019
- 308 destinations (activité passsager en 2019) dans 116 pays
- L'activite passager represente 80% du chiffre d'affaire
- 6 avions cargot
- 15,8 Milliard d'euro de chiffre d'affaire en 2017
  
### Position d'Air France sur le marché

Air France est l'une des leader du transport aérien européan. Elle est longtemps rester sur une image de chic à la française en proposant pour ses clients des services haut de gammes. Mais depuis l'arrivé des vols low-cost, Air France est en baisse de revenu ce qui l'a poussé à proposer pour tous ces vols des billet au prix reduit (seconde classe).

### Services et produitsExpliquez pourquoi et comment

Air France proposent plusieurs types de services, notament :

- Transpoirt de voyageurs (avec 80% du CA);
- Transport de marchandise
- Maintenance
  
### Formes de revenu :

Les divers formes de revenu de l'entreprise sont cité plus haut.

### Information aidant la prise de décision

+ Déterminer quel sont les liaisons les plus demander, en quel période.
+ Pour un vol donner à quel prix peut se vendre un billet pour remplir au maximum l'avion.(les prix maximum pour remplir l'avion)
+ Quels sont les distination en vogue en ce moment. (si une nouvelle destination apparait)
+ Déterminer si un vol rapporte plus ou moins qu'un autre vol.
+ Quelle est la positon de chaque avion (Gérer au mieux la flotte d'avions disponible).
+ la rentabilité de chaque type avion (Exemple: consommation trop forte de carburant d'un avion => le remplacer par un autre)
+ Affectation de l'equipage à un vol (quel pilote pour quel avion ...)

## Les actions et opérations à tracer

+ Ventes des billets/vols
  + la date de la vente.
  + le lieux de depart et d'arrivé(distination en vogue).
  + le prix de vente du billet.
  + Nombre de place occupé dans l'avion.
  + rentabilité du vol (revenu/dépenses)
  + Quel equipage pour quel vol
+ Organisation des avions et vols
  + position de chaque avion (aéroports)
  + consommation d'un avion (carburant et divers coûts)
  + capacité maximal

## Traitements possibles

+ Ventes des billes/vols
  + Analyser la demande vers une destination (le nombre de billets vendu) selon la période
  + Analyser la ratio nombre de place occupé / capacité dans l'avion pour calculé le prix du billet
  + Comparer le ratio revenu / dépenses pour chaque vol (rentabilité)
+ Organisation des avions et vols
  + Analyser la position de chaque avion afin de determiner la meilleur assignation vol <- avion
  + Analyser le coût moyen d'un avion

## Actions par ordre d’importance / rentabilité potentielle

1- Ventes des billets/vols
2- Organisation des avions et vols


## Auteurs

- Chakib Elhouiti -> celhouiti@gmail.com
- Massili Kezzoul -> massy.kezzoul@gmail.com