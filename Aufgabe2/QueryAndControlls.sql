/*-----------------Controlls----------------------------*/
GRANT SELECT ON Ferienwohnung TO dbsys47;
GRANT SELECT ON Land TO dbsys47;
GRANT SELECT ON Adresse TO dbsys47;
GRANT SELECT ON Bilder TO dbsys47;
GRANT SELECT ON Ausstattung TO dbsys47;
GRANT SELECT ON Touristenattraktion TO dbsys47;
GRANT SELECT ON Kunde TO dbsys47;
GRANT SELECT ON Buchung TO dbsys47;
GRANT SELECT ON Auszahlung TO dbsys47;
GRANT SELECT ON bietet TO dbsys47;
GRANT SELECT ON beinhaltet TO dbsys47;
commit;
rollback;

/*-----------------Zug-------------------------------------*/
SELECT adr_stadt AS Stadt, COUNT(fer_ID) AS Ferienwohnungen
FROM dbsys46.Adresse a, dbsys46.Ferienwohnung f 
WHERE a.adr_ID = f.adr_ID 
GROUP BY adr_stadt 
ORDER BY COUNT(fer_name) DESC;

SELECT fer_name AS Ferienwohnung
FROM dbsys46.Ferienwohnung f, dbsys46.Buchung b 
WHERE f.fer_ID = b.fer_ID AND f.land_name = 'Spanien' 
GROUP BY fer_name 
HAVING AVG(b.buch_sterne) > 4 
ORDER BY AVG(buch_sterne) DESC;

CREATE OR REPLACE VIEW top AS
SELECT f.fer_name AS Ferienwohnung, COUNT(aust_ID) AS Ausstattungen
FROM dbsys46.beinhaltet b, dbsys46.Ferienwohnung f 
WHERE f.fer_ID = b.fer_ID
GROUP BY f.fer_name 
ORDER BY COUNT(aust_ID) DESC;

SELECT * FROM top
FETCH FIRST 1 ROWS ONLY;

SELECT l.land_name AS Land, NVL(COUNT(b.fer_ID), 0) AS Ferienwohnungen
FROM dbsys46.Buchung b INNER JOIN dbsys46.Ferienwohnung f ON b.fer_ID = f.fer_ID
RIGHT OUTER JOIN Land l ON l.land_name = f.land_name
WHERE (buch_startdatum > sysdate) OR (f.fer_ID IS NULL)
GROUP BY l.land_name
ORDER BY NVL(COUNT(buch_nummer), 0) DESC;

CREATE OR REPLACE  VIEW ferbuchung AS
SELECT f.fer_ID as Ferienwohnung
FROM dbsys46.Buchung b, dbsys46.beinhaltet i INNER JOIN dbsys46.Ferienwohnung f ON i.fer_ID = f.fer_ID
WHERE aust_ID = 'Sauna' AND f.land_name = 'Spanien';

CREATE OR REPLACE VIEW ferdatum AS
SELECT f.fer_ID
FROM dbsys46.Buchung b INNER JOIN dbsys46.Ferienwohnung f ON f.fer_ID = b.fer_ID
WHERE((b.buch_startdatum <= '21.11.18' AND b.buch_startdatum >= '01.11.18') OR (b.buch_enddatum <= '21.11.18' AND b.buch_enddatum >= '01.11.18') OR (b.buch_startdatum <= '01.11.18' AND b.buch_enddatum >= '21.11.2018'));

CREATE OR REPLACE VIEW ferfertig AS
SELECT b.ferienwohnung 
FROM dbsys46.ferbuchung b
WHERE b.ferienwohnung NOT IN (SELECT * FROM ferdatum)
GROUP BY b.ferienwohnung; 

SELECT fer_name as Ferienwohnung, AVG(b.buch_sterne) AS Sterne
FROM Ferienwohnung f, ferfertig ff, Buchung b
WHERE f.fer_ID = ff.ferienwohnung AND b.fer_ID = ff.ferienwohnung
GROUP BY fer_name
ORDER BY AVG(b.buch_sterne) DESC;