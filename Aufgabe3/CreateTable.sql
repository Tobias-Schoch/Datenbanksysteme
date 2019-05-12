/*-----------------Land----------------------------*/
CREATE TABLE Land
( land_name                     VARCHAR2(30) PRIMARY KEY NOT NULL
);

/*-----------------Adresse----------------------------*/
CREATE TABLE Adresse
( adr_ID                        NUMBER(10) PRIMARY KEY NOT NULL,
  adr_Strasse                   VARCHAR2(30) NOT NULL,
  adr_plz                       NUMBER(5) NOT NULL,
  adr_stadt                     VARCHAR2(30) NOT NULL,
  adr_hausnummer                VARCHAR2(6) NOT NULL CHECK(adr_hausnummer > 0)
);

/*-----------------Ferienwohnung----------------------------*/
CREATE TABLE Ferienwohnung
( fer_ID                        NUMBER(10) PRIMARY KEY,
  fer_zimmer                    NUMBER(2) NOT NULL CHECK(fer_zimmer > 0),
  fer_groesse                   NUMBER(5) NOT NULL CHECK(fer_groesse > 13),
  fer_preise                    NUMBER(10) NOT NULL,
  fer_name                      VARCHAR2(30) NOT NULL,
  adr_ID                        NUMBER(10) NOT NULL,
  land_name                     VARCHAR2(30) NOT NULL,
  CONSTRAINT fk_adrID FOREIGN KEY (adr_ID) REFERENCES Adresse(adr_ID) ON DELETE CASCADE,
  CONSTRAINT fk_landname FOREIGN KEY (land_name) REFERENCES Land(land_name)
);

/*-----------------Bilder----------------------------*/
CREATE TABLE Bilder
( bil_Inhalt                    VARCHAR2(50) PRIMARY KEY NOT NULL,
  fer_ID                        NUMBER(10) NOT NULL,
  CONSTRAINT fk_ferID FOREIGN KEY (fer_ID) REFERENCES Ferienwohnung(fer_ID) ON DELETE CASCADE
);

/*-----------------Ausstattung----------------------------*/
CREATE TABLE Ausstattung
( aust_ID                       VARCHAR(20) PRIMARY KEY NOT NULL
);

/*-----------------Touristenattraktion----------------------------*/
CREATE TABLE Touristenattraktion
( tour_ID                       NUMBER(10) PRIMARY KEY NOT NULL,
  tour_name                     VARCHAR2(30) NOT NULL,
  tour_beschreibung             VARCHAR2(500)
);

/*-----------------Kunde----------------------------*/
CREATE TABLE Kunde
( kund_mailadresse              VARCHAR2(50) PRIMARY KEY NOT NULL CHECK(length(kund_mailadresse) > 0),
  kund_newsletter               NUMBER(1) NOT NULL,
  kund_passwort                 VARCHAR2(50) NOT NULL CHECK(kund_passwort > 0),
  kund_name                     VARCHAR2(30) NOT NULL,
  kund_iban                     VARCHAR2(22) NOT NULL,
  adr_ID                        NUMBER(10) NOT NULL,
  CONSTRAINT fk_adrID2 FOREIGN KEY (adr_ID) REFERENCES Adresse(adr_ID) ON DELETE CASCADE
);

/*-----------------Buchung----------------------------*/
CREATE TABLE Buchung
( buch_nummer                   NUMBER PRIMARY KEY,
  buch_datum                    DATE NOT NULL, 
  fer_ID                        NUMBER NOT NULL,
  kund_mailadresse              VARCHAR2(50) NOT NULL CHECK(length(kund_mailadresse) > 0),
  buch_startdatum               DATE NOT NULL, 
  buch_enddatum                 DATE NOT NULL,
  buch_rechnungsdatum           DATE,
  buch_rechnungsnr              NUMBER,
  buch_betrag                   NUMBER CHECK(buch_betrag > 0),
  buch_sterne                   NUMBER CHECK(buch_sterne < 6),
  buch_bewertungsdatum          DATE,
  CONSTRAINT fk_ferID2 FOREIGN KEY (fer_ID) REFERENCES Ferienwohnung(fer_ID),
  CONSTRAINT fk_kundenmail FOREIGN KEY (kund_mailadresse) REFERENCES Kunde(kund_mailadresse)
);

/*-----------------Auszahlung----------------------------*/
CREATE TABLE Auszahlung
( auszah_ID                     NUMBER(10) PRIMARY KEY NOT NULL,
  auszah_datum                  DATE NOT NULL,
  auszah_betrag                 NUMBER(10) NOT NULL CHECK(auszah_betrag > 0),
  buch_nummer                   NUMBER(10) NOT NULL,
  CONSTRAINT fk_buchnummer FOREIGN KEY (buch_nummer) REFERENCES Buchung(buch_nummer)
);

/*-----------------bietet----------------------------*/
CREATE TABLE bietet
( fer_ID                        NUMBER(10) NOT NULL,
  tour_ID                       NUMBER(10) NOT NULL,
  bietet_entfernung             NUMBER(2) NOT NULL CHECK(bietet_entfernung < 51),
  CONSTRAINT tourferID PRIMARY KEY (fer_ID, tour_ID)
);

/*-----------------beinhaltet----------------------------*/
CREATE TABLE beinhaltet
( aust_ID                       VARCHAR(20) NOT NULL,
  fer_ID                        NUMBER(10) NOT NULL,
  CONSTRAINT austferID PRIMARY KEY (aust_ID, fer_ID)
);

/*-----------------storniert----------------------------*/
CREATE TABLE storniert
( sto_datum                     DATE,
  buch_nummer                   NUMBER PRIMARY KEY,
  buch_datum                    DATE NOT NULL, 
  fer_ID                        NUMBER NOT NULL,
  kund_mailadresse              VARCHAR2(50) NOT NULL CHECK(length(kund_mailadresse) > 0),
  buch_startdatum               DATE NOT NULL, 
  buch_enddatum                 DATE NOT NULL,
  buch_rechnungsdatum           DATE,
  buch_rechnungsnr              NUMBER,
  buch_betrag                   NUMBER CHECK(buch_betrag > 0),
  buch_sterne                   NUMBER CHECK(buch_sterne < 6),
  buch_bewertungsdatum          DATE,
  CONSTRAINT fk_ferID3 FOREIGN KEY (fer_ID) REFERENCES Ferienwohnung(fer_ID),
  CONSTRAINT fk_kundenmail2 FOREIGN KEY (kund_mailadresse) REFERENCES Kunde(kund_mailadresse)
);

