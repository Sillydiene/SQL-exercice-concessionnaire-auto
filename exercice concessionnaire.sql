create table voiture( --creation table voiture
numserie integer primary key,
couleur varchar(20),
prix DECIMAL(10,2),
cout decimal(10,2),
marque VARCHAR (20),
modele varchar(20),
nomp varchar (20),
prenomp varchar(20),
foreign key (modele) references modele(modele),
foreign key(nomp,prenomp)references cliient(nomp,prenomp));

create table Arrivee( --creation table arrivee
numserie int primary key,
date1 DATE,
magasin varchar(50),
foreign key (numserie) references voiture(numserie) 
);

create table cliient(--creation table client
nomprenomc varchar (200) primary key,
adresse varchar(200));
 
 
 create table vendeur( --creation table vendeur
 nomprenomv varchar (60) primary key,
adresse varchar(200),
salairefixe decimal (20,2),
magasin varchar (200),
foreign key (magasin)REFERENCES magasin(magasin));

create table vente ( --creation table vente
numero varchar(100) primary key,
datevente DATE,
prixachat decimal(10,2),
numserie integer,
nomprenoma varchar (200),
nomprenomv varchar (150),
foreign key (numserie) references voiture(numserie),
foreign key (nomprenoma)REFERENCES cliient (nomprenomc));


create table magasin(--creation table magasin
magasin varchar(200),
foreign key (magasin)references vendeur(magasin));

create table modele(--creation table modele
modele varchar (50),
marque varchar(30)primary key,
foreign key (modele)references voiture);

--la liste des voitures (numer0) vendues apres le 15 avril 2007
select numero
from vente
where datevente > '2007-04-15';

--Donner la voiture qui rapporte le plus d'argent
select max (cout),modele
from voiture
group by modele 
order by modele desc;

--donner le vendeur ayant accorder le plus gros rabais
select nomprenomv
from vendeur
where salairefixe = (select max(salairefixe)from vendeur);

--les benefices de chaque magasin pour le mois de janvier 2007
select prixachat 
from vente
where datevente >='2007/1/1' and datevente <='2007/1/31';


--le meilleur client(celui ayant rapporter le plus d'argent a l'entreprise)
select nomprenomv, sum(prixachat) AS total_rapporte
from vente
group by nomprenomv
Order by total_rapporte DESC;


   
-- la marque pour laquelle on a accorde le plus de rabais