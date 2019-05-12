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
GRANT INSERT ON Land TO dbsys47;
GRANT INSERT ON Buchung TO dbsys47;
GRANT INSERT ON Kunde TO dbsys47;
GRANT INSERT ON Adresse TO dbsys47;
commit;
rollback;

/*-----------------Zug-------------------------------------*/
SELECT * FROM Kunde;


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
GROUP BY f.fer_name;

SELECT * FROM top
WHERE Ausstattungen = (Select Max(Ausstattungen) From top);

SELECT l.land_name AS Land, NVL(COUNT(b.fer_ID), 0) AS Ferienwohnungen
FROM dbsys46.Buchung b INNER JOIN dbsys46.Ferienwohnung f ON b.fer_ID = f.fer_ID
RIGHT OUTER JOIN dbsys46.Land l ON l.land_name = f.land_name
WHERE (buch_startdatum > sysdate) OR (f.fer_ID IS NULL)
GROUP BY l.land_name
ORDER BY NVL(COUNT(buch_nummer), 0) DESC;

CREATE OR REPLACE  VIEW ferbuchung AS
SELECT f.fer_ID as Ferienwohnung
FROM dbsys46.Buchung b, dbsys46.beinhaltet i INNER JOIN dbsys46.Ferienwohnung f ON i.fer_ID = f.fer_ID
WHERE aust_ID = 'TV' AND f.land_name = 'Deutschland';

Select * FROM ferbuchung;

CREATE OR REPLACE VIEW ferdatum AS
SELECT f.fer_ID
FROM dbsys46.Buchung b INNER JOIN dbsys46.Ferienwohnung f ON f.fer_ID = b.fer_ID
WHERE((b.buch_startdatum <= '21.11.18' AND b.buch_startdatum >= '01.11.18') OR (b.buch_enddatum <= '21.11.18' AND b.buch_enddatum >= '01.11.18') OR (b.buch_startdatum <= '01.11.18' AND b.buch_enddatum >= '21.11.2018'));

Select * from ferdatum;

CREATE OR REPLACE VIEW ferfertig AS
SELECT b.ferienwohnung 
FROM ferbuchung b
WHERE b.ferienwohnung NOT IN (SELECT * FROM ferdatum)
GROUP BY b.ferienwohnung; 

Select * from ferfertig;

SELECT fer_name as Ferienwohnung, AVG(b.buch_sterne) AS Sterne
FROM dbsys46.Ferienwohnung f, ferfertig ff LEFT OUTER JOIN dbsys46.Buchung b ON b.fer_ID = ff.ferienwohnung
WHERE f.fer_ID = ff.ferienwohnung 
GROUP BY fer_name
ORDER BY AVG(b.buch_sterne) DESC;

Select * from kunde;

Select * from Adresse;

Select * from Buchung;

CREATE OR REPLACE TRIGGER geloescht
BEFORE DELETE ON Buchung
FOR EACH ROW    
BEGIN 
    INSERT INTO storniert
    (   sto_datum,                   
        buch_nummer,                   
        buch_datum,                    
        fer_ID,                        
        kund_mailadresse,              
        buch_startdatum,               
        buch_enddatum,                 
        buch_rechnungsdatum,           
        buch_rechnungsnr,              
        buch_betrag,                   
        buch_sterne,                   
        buch_bewertungsdatum )
    VALUES (
        sysdate,                   
        :old.buch_nummer,                   
        :old.buch_datum,                    
        :old.fer_ID,                        
        :old.kund_mailadresse,              
        :old.buch_startdatum,               
        :old.buch_enddatum,                 
        :old.buch_rechnungsdatum,           
        :old.buch_rechnungsnr,              
        :old.buch_betrag,                   
        :old.buch_sterne,                   
        :old.buch_bewertungsdatum );
END;

/

DELETE FROM Buchung
WHERE buch_nummer = 1;

DELETE FROM Buchung
WHERE buch_nummer = 5;

SELECT * FROM storniert;

SELECT * FROM Buchung;

CREATE OR REPLACE VIEW stammkunde AS
SELECT k.kund_name AS Kundenname, NVL(COUNT(b.buch_nummer), 0) AS Buchungsnummer,NVL(SUM(f.fer_preise * ((b.buch_enddatum+1)-b.buch_startdatum)),0) AS Betrag
FROM Buchung b INNER JOIN Kunde k ON k.kund_mailadresse = b.kund_mailadresse, Ferienwohnung f
WHERE f.fer_ID = b.fer_ID
GROUP BY k.kund_name;

SELECT * FROM stammkunde;

SELECT * FROM stammkunde2;

CREATE OR REPLACE VIEW stammkunde2 AS
SELECT k.kund_name AS Kundenname, NVL(COUNT(s.buch_nummer), 0) AS Buchungsnummer,NVL(SUM(f.fer_preise * ((s.buch_enddatum+1)-s.buch_startdatum)),0) AS Betrag
FROM storniert s RIGHT OUTER JOIN Kunde k ON k.kund_mailadresse = s.kund_mailadresse, Ferienwohnung f
WHERE  (s.buch_nummer IS NULL) OR k.kund_mailadresse = s.kund_mailadresse AND f.fer_ID = s.fer_ID
GROUP BY k.kund_name;

CREATE OR REPLACE VIEW stammfertig AS
SELECT stammkunde.Kundenname, stammkunde.Buchungsnummer as AnzahlBuchungen , stammkunde2.Buchungsnummer as Storno, stammkunde.Betrag as Betrag
FROM stammkunde INNER JOIN stammkunde2 ON stammkunde.Kundenname = stammkunde2.Kundenname;

SELECT * FROM stammfertig;

