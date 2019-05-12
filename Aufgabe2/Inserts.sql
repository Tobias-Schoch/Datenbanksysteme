/*-----------------Land----------------------------*/
INSERT INTO Land VALUES ('Deutschland');
INSERT INTO Land VALUES ('Frankreich');
INSERT INTO Land VALUES ('Polen');
INSERT INTO Land VALUES ('Spanien');
INSERT INTO Land VALUES ('Portugal');

/*-----------------Adresse----------------------------*/
INSERT INTO Adresse VALUES (1,'Auf der Insel',78462,'Konstanz',1);
INSERT INTO Adresse VALUES (2,'Sigismundstr.',78462,'Konstanz',19);
INSERT INTO Adresse VALUES (3,'Seewartenstr.',20355,'Hamburg',9);
INSERT INTO Adresse VALUES (4,'Nürnbergerstr. 50',10318,'Berlin',13);
INSERT INTO Adresse VALUES (5,'Baguettestr.',75003,'Paris',10);
INSERT INTO Adresse VALUES (6,'Croissantstr.',75003,'Paris',51);
INSERT INTO Adresse VALUES (7,'Rue de Allee',69001,'Lyon',1);
INSERT INTO Adresse VALUES (8,'Fahrradweg Allee',10006,'Warschau',7);
INSERT INTO Adresse VALUES (9,'Schmidtstr.',30006,'Krakau',3);
INSERT INTO Adresse VALUES (10,'Pablostr.',28005,'Madrid',6);
INSERT INTO Adresse VALUES (11,'Carrerstr.',28005,'Madrid',31);
INSERT INTO Adresse VALUES (12,'Balmesstr.',54345,'Barcelona',22);
INSERT INTO Adresse VALUES (13,'Torrostr.',23432,'Mallorca',15);
INSERT INTO Adresse VALUES (14,'Pierrestr.',28005,'Madrid',1);
INSERT INTO Adresse VALUES (15,'Duquestr.',10508,'Lissabon',81);
INSERT INTO Adresse VALUES (16,'Puquestr.',08239,'Algarve',343);

/*-----------------Ferienwohnung----------------------------*/
INSERT INTO Ferienwohnung VALUES (1,3,35,157,'Steigenberger',1,'Deutschland');
INSERT INTO Ferienwohnung VALUES (2,3,41,114,'VivaSky',2,'Deutschland');
INSERT INTO Ferienwohnung VALUES (3,2,21,48,'Hotel Hafen',3,'Deutschland');
INSERT INTO Ferienwohnung VALUES (4,1,33,64,'Ellington',4,'Deutschland');
INSERT INTO Ferienwohnung VALUES (5,2,80,783,'Ritz',5,'Frankreich');
INSERT INTO Ferienwohnung VALUES (6,1,25,78,'Ibis',6,'Frankreich');
INSERT INTO Ferienwohnung VALUES (7,1,20,110,'Alexandra',7,'Frankreich');
INSERT INTO Ferienwohnung VALUES (8,3,46,54,'Polonia',8,'Polen');
INSERT INTO Ferienwohnung VALUES (9,2,60,88,'Wyspianski',9,'Polen');
INSERT INTO Ferienwohnung VALUES (10,2,43,237,'Regina',10,'Spanien');
INSERT INTO Ferienwohnung VALUES (11,1,21,55,'Santo Domingo',11,'Spanien');
INSERT INTO Ferienwohnung VALUES (12,4,56,156,'Grums',12,'Spanien');
INSERT INTO Ferienwohnung VALUES (13,2,27,91,'Iberostar',13,'Spanien');
INSERT INTO Ferienwohnung VALUES (14,5,95,401,'H10 Duque',14,'Spanien');
INSERT INTO Ferienwohnung VALUES (15,1,25,30,'Zum Piedro',15,'Portugal');

/*-----------------Kunde----------------------------*/
INSERT INTO Kunde VALUES ('lukas.wanner@web.de',1,1243124,'Lukas Wanner','DE12345667878956',1);
INSERT INTO Kunde VALUES ('tobias@schochwebdesign.de',0,645234,'Tobias Schoch','DE34566547846851',2);
INSERT INTO Kunde VALUES ('juliane.armbruster@web.de',1,86532452,'Juliane Armbruster','DE47868536877892',3);

/*-----------------Buchung----------------------------*/

INSERT INTO Buchung VALUES (1,to_date('01.09.2018', 'DD.MM.YYYY'),1,'tobias@schochwebdesign.de',to_date('01.09.2018', 'DD.MM.YYYY'),to_date('01.12.2018', 'DD.MM.YYYY'),to_date('01.09.2018', 'DD.MM.YYYY'),1,628,3,to_date('01.09.2018', 'DD.MM.YYYY'));
INSERT INTO Buchung VALUES (2,to_date('13.10.2018', 'DD.MM.YYYY'),2,'juliane.armbruster@web.de',to_date('13.10.2018', 'DD.MM.YYYY'),to_date('01.11.2018', 'DD.MM.YYYY'),to_date('13.10.2018', 'DD.MM.YYYY'),2,32,4,to_date('13.10.2018', 'DD.MM.YYYY'));
INSERT INTO Buchung VALUES (3,to_date('01.11.2018', 'DD.MM.YYYY'),14,'lukas.wanner@web.de',to_date('01.11.2018', 'DD.MM.YYYY'),to_date('01.11.2018', 'DD.MM.YYYY'),to_date('01.11.2018', 'DD.MM.YYYY'),3,674,2,to_date('01.11.2018', 'DD.MM.YYYY'));
INSERT INTO Buchung VALUES (4,to_date('25.06.2019', 'DD.MM.YYYY'),4,'tobias@schochwebdesign.de',to_date('25.06.2019', 'DD.MM.YYYY'),to_date('25.06.2019', 'DD.MM.YYYY'),to_date('25.06.2019', 'DD.MM.YYYY'),4,128,1,to_date('25.06.2019', 'DD.MM.YYYY'));
INSERT INTO Buchung VALUES (5,to_date('03.07.2019', 'DD.MM.YYYY'),5,'juliane.armbruster@web.de',to_date('03.07.2019', 'DD.MM.YYYY'),to_date('03.07.2019', 'DD.MM.YYYY'),to_date('03.07.2019', 'DD.MM.YYYY'),5,440,5,to_date('03.07.2019', 'DD.MM.YYYY'));
INSERT INTO Buchung VALUES (6,to_date('09.08.2019', 'DD.MM.YYYY'),10,'lukas.wanner@web.de',to_date('09.08.2019', 'DD.MM.YYYY'),to_date('09.08.2019', 'DD.MM.YYYY'),to_date('09.08.2019', 'DD.MM.YYYY'),6,1659,3,to_date('09.08.2019', 'DD.MM.YYYY'));
INSERT INTO Buchung VALUES (7,to_date('29.09.2019', 'DD.MM.YYYY'),10,'tobias@schochwebdesign.de',to_date('29.09.2019', 'DD.MM.YYYY'),to_date('29.09.2019', 'DD.MM.YYYY'),to_date('29.09.2019', 'DD.MM.YYYY'),7,237,5,to_date('29.09.2019', 'DD.MM.YYYY'));
INSERT INTO Buchung VALUES (8,to_date('31.10.2019', 'DD.MM.YYYY'),10,'juliane.armbruster@web.de',to_date('23.11.2018', 'DD.MM.YYYY'),to_date('24.11.2018', 'DD.MM.YYYY'),to_date('31.10.2019', 'DD.MM.YYYY'),8,711,5,to_date('31.10.2019', 'DD.MM.YYYY'));
INSERT INTO Buchung VALUES (9,to_date('24.11.2019', 'DD.MM.YYYY'),11,'lukas.wanner@web.de',to_date('20.11.2018', 'DD.MM.YYYY'),to_date('24.11.2018', 'DD.MM.YYYY'),to_date('24.11.2019', 'DD.MM.YYYY'),9,110,4,to_date('24.11.2019', 'DD.MM.YYYY'));
INSERT INTO Buchung VALUES (10,to_date('26.12.2019', 'DD.MM.YYYY'),12,'tobias@schochwebdesign.de',to_date('26.12.2019', 'DD.MM.YYYY'),to_date('26.12.2019', 'DD.MM.YYYY'),to_date('26.12.2019', 'DD.MM.YYYY'),10,156,5,to_date('26.12.2019', 'DD.MM.YYYY'));
INSERT INTO Buchung VALUES (11,to_date('02.02.2020', 'DD.MM.YYYY'),13,'juliane.armbruster@web.de',to_date('02.02.2020', 'DD.MM.YYYY'),to_date('02.02.2020', 'DD.MM.YYYY'),to_date('02.02.2020', 'DD.MM.YYYY'),11,1274,3,to_date('02.02.2020', 'DD.MM.YYYY'));

/*-----------------Ausstattung-----------------------*/
INSERT INTO Ausstattung VALUES('Sauna');
INSERT INTO Ausstattung VALUES('Pool');
INSERT INTO Ausstattung VALUES('Minbar');
INSERT INTO Ausstattung VALUES('TV');
INSERT INTO Ausstattung VALUES('WLAN');
INSERT INTO Ausstattung VALUES('XBOX');
INSERT INTO Ausstattung VALUES('Playstation');
INSERT INTO Ausstattung VALUES('Garten');
INSERT INTO Ausstattung VALUES('PC');
INSERT INTO Ausstattung VALUES('Laptop');
INSERT INTO Ausstattung VALUES('Nokia 3310');

/*-----------------beinhaltet------------------------*/
INSERT INTO beinhaltet VALUES('Sauna',1);
INSERT INTO beinhaltet VALUES('WLAN',1);
INSERT INTO beinhaltet VALUES('Garten',1);
INSERT INTO beinhaltet VALUES('Pool',2);
INSERT INTO beinhaltet VALUES('Garten',2);
INSERT INTO beinhaltet VALUES('TV',3);
INSERT INTO beinhaltet VALUES('Laptop',3);
INSERT INTO beinhaltet VALUES('Nokia 3310',3);
INSERT INTO beinhaltet VALUES('Pool',4);
INSERT INTO beinhaltet VALUES('Sauna',5);
INSERT INTO beinhaltet VALUES('Pool',5);
INSERT INTO beinhaltet VALUES('Minbar',5);
INSERT INTO beinhaltet VALUES('TV',5);
INSERT INTO beinhaltet VALUES('WLAN',5);
INSERT INTO beinhaltet VALUES('XBOX',5);
INSERT INTO beinhaltet VALUES('Playstation',5);
INSERT INTO beinhaltet VALUES('Garten',5);
INSERT INTO beinhaltet VALUES('PC',5);
INSERT INTO beinhaltet VALUES('Laptop',5);
INSERT INTO beinhaltet VALUES('Nokia 3310',5);
INSERT INTO beinhaltet VALUES('TV',6);
INSERT INTO beinhaltet VALUES('Garten',6);
INSERT INTO beinhaltet VALUES('PC',6);
INSERT INTO beinhaltet VALUES('Nokia 3310',6);
INSERT INTO beinhaltet VALUES('Minbar',7);
INSERT INTO beinhaltet VALUES('WLAN',7);
INSERT INTO beinhaltet VALUES('Garten',7);
INSERT INTO beinhaltet VALUES('Sauna',8);
INSERT INTO beinhaltet VALUES('TV',8);
INSERT INTO beinhaltet VALUES('Sauna',9);
INSERT INTO beinhaltet VALUES('XBOX',9);
INSERT INTO beinhaltet VALUES('PC',9);
INSERT INTO beinhaltet VALUES('Sauna',10);
INSERT INTO beinhaltet VALUES('TV',10);
INSERT INTO beinhaltet VALUES('WLAN',10);
INSERT INTO beinhaltet VALUES('XBOX',10);
INSERT INTO beinhaltet VALUES('Garten',10);
INSERT INTO beinhaltet VALUES('Nokia 3310',10);
INSERT INTO beinhaltet VALUES('Minbar',11);
INSERT INTO beinhaltet VALUES('XBOX',11);
INSERT INTO beinhaltet VALUES('Laptop',11);
INSERT INTO beinhaltet VALUES('Pool',12);
INSERT INTO beinhaltet VALUES('XBOX',12);
INSERT INTO beinhaltet VALUES('Sauna',13);
INSERT INTO beinhaltet VALUES('TV',13);
INSERT INTO beinhaltet VALUES('Playstation',13);
INSERT INTO beinhaltet VALUES('Garten',13);
INSERT INTO beinhaltet VALUES('Sauna',14);
INSERT INTO beinhaltet VALUES('Pool',14);
INSERT INTO beinhaltet VALUES('Minbar',14);
INSERT INTO beinhaltet VALUES('TV',14);
INSERT INTO beinhaltet VALUES('WLAN',14);
INSERT INTO beinhaltet VALUES('XBOX',14);
INSERT INTO beinhaltet VALUES('Playstation',14);
INSERT INTO beinhaltet VALUES('Garten',14);
INSERT INTO beinhaltet VALUES('Laptop',14);
INSERT INTO beinhaltet VALUES('Nokia 3310',14);

Commit;