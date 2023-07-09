CREATE TABLE TARI_2 (
    Id_tara VARCHAR2(5) CONSTRAINT PK_tari PRIMARY KEY,
    Nume_tara VARCHAR2(200) NOT NULL
);

CREATE TABLE AEROPORTURI (
	Id_aeroport NUMBER(3) CONSTRAINT PK_aeroporturi PRIMARY KEY,
	Nume_aeroport VARCHAR2(200) NOT NULL,
	Oras VARCHAR2(200) NOT NULL,
	Id_tara VARCHAR2(5) NOT NULL,
	Cod_aeroport VARCHAR2(5) NOT NULL,
	CONSTRAINT FK_tari FOREIGN KEY (Id_tara) REFERENCES TARI_2 (Id_tara)
);

CREATE TABLE COMPANII_AERIENE (
	Id_companie NUMBER(3) CONSTRAINT PK_companii PRIMARY KEY,
	Nume_companie VARCHAR2(200) NOT NULL,
	Nume_tara VARCHAR2(5) NOT NULL,
	An_fondare NUMBER(4) NOT NULL
);

CREATE TABLE CURSE (
	Id_cursa NUMBER(3) CONSTRAINT PK_curse PRIMARY KEY,
	Aeroport_plecare VARCHAR2(200) NOT NULL,
	Aeroport_sosire VARCHAR2(200) NOT NULL,
	Durata_cursa NUMBER(5) NOT NULL,
	Id_companie NUMBER(3) NOT NULL,
	CONSTRAINT FK_companii FOREIGN KEY (Id_companie) REFERENCES COMPANII_AERIENE (Id_companie)
);

CREATE TABLE ZBORURI (
	Id_zbor NUMBER(3) CONSTRAINT PK_zboruri PRIMARY KEY,
	Nume_zbor VARCHAR2(200) NOT NULL,
	Data_plecarii DATE NOT NULL,
	Data_sosirii DATE NOT NULL,
	Id_cursa NUMBER(3) NOT NULL,
	CONSTRAINT FK_curse FOREIGN KEY (Id_cursa) REFERENCES CURSE (Id_cursa)
);

CREATE TABLE PASAGERI (
	Id_pasager NUMBER(3) CONSTRAINT PK_pasageri  PRIMARY KEY,
	Nume_pasager VARCHAR2(200) NOT NULL,
	Prenume_pasager VARCHAR2(200) NOT NULL,
	Varsta_pasager NUMBER(3) NOT NULL
);

CREATE TABLE BILETE (
	Id_bilet NUMBER(3) CONSTRAINT PK_bilete PRIMARY KEY,
	Id_zbor NUMBER(3) NOT NULL,
	Id_pasager NUMBER(3) NOT NULL,
	Tip_bilet VARCHAR2(200) NOT NULL,
	Pret NUMBER(4) NOT NULL,
	CONSTRAINT FK_zboruri FOREIGN KEY (Id_zbor) REFERENCES ZBORURI (Id_zbor),
	CONSTRAINT FK_pasageri FOREIGN KEY (Id_pasager) REFERENCES PASAGERI (Id_pasager)
);

CREATE TABLE ECHIPAJ (
	Id_echipaj NUMBER(3),
	Id_zbor NUMBER(3) NOT NULL,
	Id_membru NUMBER(3) NOT NULL CONSTRAINT PK_membru_echipaj PRIMARY KEY,
	Nume_membru VARCHAR2(200) NOT NULL,
	Functie VARCHAR2(200) NOT NULL,
    Experienta NUMBER(2) NOT NULL,
    Id_superior NUMBER(2),
	CONSTRAINT FK_zbr FOREIGN KEY (Id_zbor) REFERENCES ZBORURI (Id_zbor)
);

DROP TABLE ECHIPAJ;

INSERT INTO TARI_2 (Id_tara, Nume_tara) VALUES ('RO', 'Romania');
INSERT INTO TARI_2 (Id_tara, Nume_tara) VALUES ('DE', 'Germania');
INSERT INTO TARI_2 (Id_tara, Nume_tara) VALUES ('NL', 'Olanda');
INSERT INTO TARI_2 (Id_tara, Nume_tara) VALUES ('GB', 'Marea Britanie');
INSERT INTO TARI_2 (Id_tara, Nume_tara) VALUES ('FR', 'Franta');
INSERT INTO TARI_2 (Id_tara, Nume_tara) VALUES ('IE', 'Irlanda');
INSERT INTO TARI_2 (Id_tara, Nume_tara) VALUES ('PT', 'Portugalia');
INSERT INTO TARI_2 (Id_tara, Nume_tara) VALUES ('IT', 'Italia');
INSERT INTO TARI_2 (Id_tara, Nume_tara) VALUES ('AR', 'Argentina');
INSERT INTO TARI_2 (Id_tara, Nume_tara) VALUES ('ES', 'Spania');

INSERT INTO AEROPORTURI (Id_aeroport, Nume_aeroport, Oras, Id_tara, Cod_aeroport)
VALUES (1, 'Aeroportul International Otopeni', 'Bucuresti', 'RO', 'BIO');
INSERT INTO AEROPORTURI (Id_aeroport, Nume_aeroport, Oras, Id_tara, Cod_aeroport)
VALUES(2, 'Aeroportul Henri Coanda', 'Bucuresti', 'RO', 'BHC');
INSERT INTO AEROPORTURI (Id_aeroport, Nume_aeroport, Oras, Id_tara, Cod_aeroport)
VALUES(3, 'Aeroportul International Cluj-Napoca', 'Cluj-Napoca', 'RO', 'CJI');
INSERT INTO AEROPORTURI (Id_aeroport, Nume_aeroport, Oras, Id_tara, Cod_aeroport)
VALUES(4, 'Aeroportul International Timisoara', 'Timisoara', 'RO', 'TIT');
INSERT INTO AEROPORTURI (Id_aeroport, Nume_aeroport, Oras, Id_tara, Cod_aeroport)
VALUES(5, 'Aeroportul International Sibiu', 'Sibiu', 'RO', 'SIS');
INSERT INTO AEROPORTURI (Id_aeroport, Nume_aeroport, Oras, Id_tara, Cod_aeroport)
VALUES(6, 'Aeroportul International Oradea', 'Oradea', 'RO', 'OIO');
INSERT INTO AEROPORTURI (Id_aeroport, Nume_aeroport, Oras, Id_tara, Cod_aeroport)
VALUES(7, 'Aeroportul International Mihail Kogalniceanu', 'Constanta', 'RO', 'CMK');
INSERT INTO AEROPORTURI (Id_aeroport, Nume_aeroport, Oras, Id_tara, Cod_aeroport)
VALUES(8, 'Aeroportul International Iasi', 'Iasi', 'RO', 'III');
INSERT INTO AEROPORTURI (Id_aeroport, Nume_aeroport, Oras, Id_tara, Cod_aeroport)
VALUES(9, 'Aeroportul International Craiova', 'Craiova', 'RO', 'CIC');
INSERT INTO AEROPORTURI (Id_aeroport, Nume_aeroport, Oras, Id_tara, Cod_aeroport)
VALUES(10, 'Aeroportul International Bacau', 'Bacau', 'RO', 'BIB');

ALTER TABLE COMPANII_AERIENE 
MODIFY (Nume_tara VARCHAR2(200));

INSERT INTO COMPANII_AERIENE (Id_companie, Nume_companie, Nume_tara, An_fondare)
VALUES (1, 'Tarom', 'Romania', '1954');
INSERT INTO COMPANII_AERIENE (Id_companie, Nume_companie, Nume_tara, An_fondare)
VALUES (2, 'Wizz Air', 'Romania', '2003');
INSERT INTO COMPANII_AERIENE (Id_companie, Nume_companie, Nume_tara, An_fondare)
VALUES (3, 'Blue Air', 'Romania', '2004');
INSERT INTO COMPANII_AERIENE (Id_companie, Nume_companie, Nume_tara, An_fondare)
VALUES (4, 'Lufthansa', 'Germania', '1926');
INSERT INTO COMPANII_AERIENE (Id_companie, Nume_companie, Nume_tara, An_fondare)
VALUES (5, 'KLM', 'Olanda', '1919');
INSERT INTO COMPANII_AERIENE (Id_companie, Nume_companie, Nume_tara, An_fondare)
VALUES (6, 'British Airways', 'Marea Britanie', '1974');
INSERT INTO COMPANII_AERIENE (Id_companie, Nume_companie, Nume_tara, An_fondare)
VALUES (7, 'Air France', 'Franta', '1933');
INSERT INTO COMPANII_AERIENE (Id_companie, Nume_companie, Nume_tara, An_fondare)
VALUES (8, 'Ryanair', 'Irlanda', '1985');
INSERT INTO COMPANII_AERIENE (Id_companie, Nume_companie, Nume_tara, An_fondare)
VALUES (9, 'TAP Portugal','Portugalia', '1945');
INSERT INTO COMPANII_AERIENE (Id_companie, Nume_companie, Nume_tara, An_fondare)
VALUES (10, 'Alitalia', 'Italia', '1947');

INSERT INTO CURSE (Id_cursa, Aeroport_plecare, Aeroport_sosire, Durata_cursa, Id_companie)
VALUES (1, 'Aeroportul International Otopeni', 'Aeroportul International Cluj-Napoca', 80, 1);
INSERT INTO CURSE (Id_cursa, Aeroport_plecare, Aeroport_sosire, Durata_cursa, Id_companie)
VALUES (2, 'Aeroportul International Otopeni', 'Aeroportul International Timisoara', 70, 1);
INSERT INTO CURSE (Id_cursa, Aeroport_plecare, Aeroport_sosire, Durata_cursa, Id_companie)
VALUES (3, 'Aeroportul International Otopeni', 'Aeroportul International Sibiu', 80, 2);
INSERT INTO CURSE (Id_cursa, Aeroport_plecare, Aeroport_sosire, Durata_cursa, Id_companie)
VALUES (4, 'Aeroportul International Otopeni', 'Aeroportul International Oradea', 70, 3);
INSERT INTO CURSE (Id_cursa, Aeroport_plecare, Aeroport_sosire, Durata_cursa, Id_companie)
VALUES (5, 'Aeroportul International Otopeni', 'Aeroportul International Mihail Kogalniceanu', 90, 1);
INSERT INTO CURSE (Id_cursa, Aeroport_plecare, Aeroport_sosire, Durata_cursa, Id_companie)
VALUES (6, 'Aeroportul International Otopeni', 'Aeroportul International Iasi', 110, 2);
INSERT INTO CURSE (Id_cursa, Aeroport_plecare, Aeroport_sosire, Durata_cursa, Id_companie)
VALUES (7, 'Aeroportul International Otopeni', 'Aeroportul International Craiova', 80, 1);
INSERT INTO CURSE (Id_cursa, Aeroport_plecare, Aeroport_sosire, Durata_cursa, Id_companie)
VALUES (8, 'Aeroportul International Otopeni', 'Aeroportul International Bacau', 90, 3);
INSERT INTO CURSE (Id_cursa, Aeroport_plecare, Aeroport_sosire, Durata_cursa, Id_companie)
VALUES (9, 'Aeroportul International Otopeni', 'Aeroportul Henri Coanda', 10, 1);
INSERT INTO CURSE (Id_cursa, Aeroport_plecare, Aeroport_sosire, Durata_cursa, Id_companie)
VALUES (10, 'Aeroportul Henri Coanda', 'Londra', 300, 5);

INSERT INTO ZBORURI (Id_zbor, Nume_zbor, Data_plecarii, Data_sosirii, Id_cursa)
VALUES (1, 'Tarom Zbor 841', TO_DATE('01-06-2020','dd-mm-yyyy'), TO_DATE('02-06-2020','dd-mm-yyyy'), 1);
INSERT INTO ZBORURI (Id_zbor, Nume_zbor, Data_plecarii, Data_sosirii, Id_cursa)
VALUES (2, 'Tarom Zbor 842', TO_DATE('02-06-2020','dd-mm-yyyy'), TO_DATE('03-06-2020','dd-mm-yyyy'), 1);
INSERT INTO ZBORURI (Id_zbor, Nume_zbor, Data_plecarii, Data_sosirii, Id_cursa)
VALUES (3, 'Wizz Air Zbor 801', TO_DATE('03-06-2020','dd-mm-yyyy'), TO_DATE('04-06-2020','dd-mm-yyyy'), 2);
INSERT INTO ZBORURI (Id_zbor, Nume_zbor, Data_plecarii, Data_sosirii, Id_cursa)
VALUES (4, 'Wizz Air Zbor 802', TO_DATE('04-06-2020','dd-mm-yyyy'), TO_DATE('05-06-2020','dd-mm-yyyy'), 2);
INSERT INTO ZBORURI (Id_zbor, Nume_zbor, Data_plecarii, Data_sosirii, Id_cursa)
VALUES (5, 'Blue Air Zbor 861', TO_DATE('05-06-2020','dd-mm-yyyy'), TO_DATE('06-06-2020','dd-mm-yyyy'), 3);
INSERT INTO ZBORURI (Id_zbor, Nume_zbor, Data_plecarii, Data_sosirii, Id_cursa)
VALUES (6, 'Blue Air Zbor 862', TO_DATE('06-06-2020','dd-mm-yyyy'), TO_DATE('07-06-2020','dd-mm-yyyy'), 3);
INSERT INTO ZBORURI (Id_zbor, Nume_zbor, Data_plecarii, Data_sosirii, Id_cursa)
VALUES (7, 'Lufthansa Zbor 831', TO_DATE('07-06-2020','dd-mm-yyyy'), TO_DATE('08-06-2020','dd-mm-yyyy'), 4);
INSERT INTO ZBORURI (Id_zbor, Nume_zbor, Data_plecarii, Data_sosirii, Id_cursa)
VALUES (8, 'Lufthansa Zbor 832', TO_DATE('08-06-2020','dd-mm-yyyy'), TO_DATE('09-06-2020','dd-mm-yyyy'), 4);
INSERT INTO ZBORURI (Id_zbor, Nume_zbor, Data_plecarii, Data_sosirii, Id_cursa)
VALUES (9, 'KLM Zbor 871', TO_DATE('09-06-2020','dd-mm-yyyy'), TO_DATE('10-06-2020','dd-mm-yyyy'), 5);
INSERT INTO ZBORURI (Id_zbor, Nume_zbor, Data_plecarii, Data_sosirii, Id_cursa)
VALUES (10, 'KLM Zbor 872', TO_DATE('10-06-2020','dd-mm-yyyy'), TO_DATE('11-06-2020','dd-mm-yyyy'), 5);

INSERT INTO PASAGERI (Id_pasager, Nume_pasager, Prenume_pasager, Varsta_pasager)
VALUES (1, 'Popescu', 'Ion', 32);
INSERT INTO PASAGERI (Id_pasager, Nume_pasager, Prenume_pasager, Varsta_pasager)
VALUES (2, 'Popescu', 'Maria', 28);
INSERT INTO PASAGERI (Id_pasager, Nume_pasager, Prenume_pasager, Varsta_pasager)
VALUES (3, 'Ionescu', 'Vasile', 37);
INSERT INTO PASAGERI (Id_pasager, Nume_pasager, Prenume_pasager, Varsta_pasager)
VALUES (4, 'Ionescu', 'Ana', 42);
INSERT INTO PASAGERI (Id_pasager, Nume_pasager, Prenume_pasager, Varsta_pasager)
VALUES (5, 'Andrei', 'Alexandru', 25);
INSERT INTO PASAGERI (Id_pasager, Nume_pasager, Prenume_pasager, Varsta_pasager)
VALUES (6, 'Andrei', 'Adriana', 27);
INSERT INTO PASAGERI (Id_pasager, Nume_pasager, Prenume_pasager, Varsta_pasager)
VALUES (7, 'Vasilescu', 'Mihai', 33);
INSERT INTO PASAGERI (Id_pasager, Nume_pasager, Prenume_pasager, Varsta_pasager)
VALUES(8, 'Vasilescu', 'Cristina', 29);
INSERT INTO PASAGERI (Id_pasager, Nume_pasager, Prenume_pasager, Varsta_pasager)
VALUES (9, 'Dumitrescu', 'Ion', 36);
INSERT INTO PASAGERI (Id_pasager, Nume_pasager, Prenume_pasager, Varsta_pasager)
VALUES (10, 'Dumitrescu', 'Elena', 40);

INSERT INTO BILETE (Id_bilet, Id_zbor, Id_pasager, Tip_bilet, Pret) VALUES (1, 1, 1, 'business', 200);
INSERT INTO BILETE (Id_bilet, Id_zbor, Id_pasager, Tip_bilet, Pret) VALUES (2, 1, 2, 'business', 200);
INSERT INTO BILETE (Id_bilet, Id_zbor, Id_pasager, Tip_bilet, Pret) VALUES (3, 2, 3, 'first', 250);
INSERT INTO BILETE (Id_bilet, Id_zbor, Id_pasager, Tip_bilet, Pret) VALUES (4, 2, 4, 'first', 250);
INSERT INTO BILETE (Id_bilet, Id_zbor, Id_pasager, Tip_bilet, Pret) VALUES (5, 3, 5, 'economic', 150);
INSERT INTO BILETE (Id_bilet, Id_zbor, Id_pasager, Tip_bilet, Pret) VALUES (6, 3, 6, 'business', 200);
INSERT INTO BILETE (Id_bilet, Id_zbor, Id_pasager, Tip_bilet, Pret) VALUES (7, 4, 7, 'first', 250);
INSERT INTO BILETE (Id_bilet, Id_zbor, Id_pasager, Tip_bilet, Pret) VALUES (8, 4, 8, 'business', 200);
INSERT INTO BILETE (Id_bilet, Id_zbor, Id_pasager, Tip_bilet, Pret) VALUES (9, 5, 9, 'economic', 150);
INSERT INTO BILETE (Id_bilet, Id_zbor, Id_pasager, Tip_bilet, Pret) VALUES (10, 5, 10, 'first', 250);

INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta)
VALUES (1, 1, 1, 'Gheorghe', 'pilot', 10);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (1, 1, 2, 'Ion', 'copilot', 5, 1);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (1, 1, 3, 'Mihai', 'steward', 3, 2);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (1, 1, 4, 'Ioana', 'steward', 3, 2);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta)
VALUES (2, 2, 5, 'Vasile', 'pilot', 10);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (2, 2, 6, 'Marius', 'copilot', 6, 5);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (2, 2, 7, 'Valentin', 'steward', 5, 6);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (2, 2, 8, 'Iulia', 'steward', 4, 6);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta)
VALUES (3, 3, 9, 'Alexandru', 'pilot', 9);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (3, 3, 10, 'Cristian', 'copilot', 8, 9);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (3, 3, 11, 'Gheorghita', 'steward', 7, 10);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (3, 3, 12, 'Roxana', 'steward', 7, 10);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta)
VALUES (4, 4, 13, 'Gheorghe', 'pilot', 8);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (4, 4, 14, 'Adrian', 'copilot', 3, 13);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (4, 4, 15, 'Iulia', 'steward', 4, 14);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (4, 4, 16, 'Anca', 'steward', 4, 14);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta)
VALUES (5, 5, 17, 'Alexandru', 'pilot', 9);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (5, 5, 18, 'Vasile', 'copilot', 6, 17);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (5, 5, 19, 'Valentin', 'steward', 5, 18);
INSERT INTO ECHIPAJ (Id_echipaj, Id_zbor, Id_membru, Nume_membru, Functie, Experienta, Id_superior)
VALUES (5, 5, 20, 'Ioana', 'steward', 3, 18);

SELECT * FROM TARI_2;
SELECT * FROM AEROPORTURI;
SELECT * FROM COMPANII_AERIENE;
SELECT * FROM CURSE;
SELECT * FROM ZBORURI;
SELECT * FROM PASAGERI;
SELECT * FROM BILETE;
SELECT * FROM ECHIPAJ;


--Realizati 12 interogari in care sa folositi comenzile alter, select, update, delete;

ALTER TABLE TARI_2 ADD(Limbi_vorbite VARCHAR(50));
SELECT * FROM TARI_2;

ALTER TABLE ZBORURI ADD(Numar_pasageri NUMBER(3));
SELECT * FROM ZBORURI;

ALTER TABLE CURSE ADD(Tip_avion VARCHAR(50));
SELECT * FROM CURSE;

SELECT Nume_companie, An_fondare FROM COMPANII_AERIENE WHERE Nume_tara = 'Romania';

SELECT Nume_zbor, Data_plecarii, Data_sosirii FROM ZBORURI WHERE Id_cursa = 3;

SELECT Nume_aeroport, Oras, Id_tara FROM AEROPORTURI WHERE Cod_aeroport = 'BIB';

UPDATE CURSE SET Durata_cursa = 70 WHERE Id_cursa = 6;
SELECT * FROM CURSE WHERE Id_cursa = 6;

UPDATE PASAGERI SET Varsta_pasager = 35 WHERE Id_pasager = 10;
SELECT * FROM PASAGERI WHERE ID_PASAGER=10;

UPDATE COMPANII_AERIENE SET An_fondare = '1935' WHERE Id_companie = 9;
SELECT * FROM COMPANII_AERIENE WHERE Id_companie = 9;

DELETE FROM BILETE WHERE Id_bilet = 8;
SELECT * FROM BILETE;

DELETE FROM aeroporturi WHERE Id_aeroport = 4;
SELECT * FROM AEROPORTURI;

DELETE FROM TARI_2 WHERE Id_tara = 'ES';
SELECT * FROM TARI_2;

--Realizati 8 interogari in care sa folositi cele 4 tipuri de jonctiuni: left join, right join, inner join, outer join;

SELECT Z.Nume_zbor, B.Tip_bilet, C.Durata_cursa, B.Pret FROM BILETE B
LEFT JOIN ZBORURI Z ON B.Id_zbor = Z.Id_zbor
LEFT JOIN CURSE C ON Z.Id_cursa = C.Id_cursa;

SELECT A.Cod_aeroport, A.Nume_aeroport, T.Nume_tara
FROM Aeroporturi A
LEFT JOIN Tari_2 T ON A.Id_tara = T.Id_tara;

SELECT TARI_2.Nume_tara, AEROPORTURI.Oras, AEROPORTURI.Nume_aeroport FROM TARI_2
RIGHT JOIN AEROPORTURI ON TARI_2.Id_tara = AEROPORTURI.Id_tara;

SELECT PASAGERI.Nume_pasager, PASAGERI.Prenume_pasager, ZBORURI.Nume_zbor, 
ZBORURI.Data_plecarii FROM PASAGERI
RIGHT JOIN BILETE ON PASAGERI.Id_pasager = BILETE.Id_pasager
LEFT JOIN ZBORURI ON BILETE.Id_zbor = ZBORURI.Id_zbor;

SELECT CURSE.Aeroport_plecare, CURSE.Aeroport_sosire, COMPANII_AERIENE.Nume_companie
FROM CURSE
INNER JOIN COMPANII_AERIENE ON CURSE.Id_companie = COMPANII_AERIENE.Id_companie;

SELECT COMPANII_AERIENE.Nume_tara, COMPANII_AERIENE.Nume_companie, ZBORURI.Nume_zbor, 
ZBORURI.Data_plecarii, ZBORURI.Data_sosirii FROM COMPANII_AERIENE 
INNER JOIN CURSE ON COMPANII_AERIENE.Id_companie = CURSE.Id_companie 
INNER JOIN ZBORURI ON CURSE.Id_cursa = ZBORURI.Id_cursa;

SELECT T.Nume_tara, A.Nume_aeroport FROM TARI_2 T 
RIGHT OUTER JOIN AEROPORTURI A ON T.Id_tara = A.Id_tara;

SELECT Z.Nume_zbor, P.Nume_pasager, B.Pret FROM ZBORURI Z
LEFT OUTER JOIN BILETE B ON Z.Id_zbor = B.Id_zbor
RIGHT OUTER JOIN PASAGERI P ON P.Id_pasager = B.Id_pasager;

--Realizati 6 interogari in care sa folositi functiile de grup ;

SELECT AVG(Durata_cursa) AS Durata_medie_a_curselor
FROM CURSE 
WHERE Id_companie in (1, 3)
GROUP BY Id_companie
HAVING AVG(Durata_cursa) < 90;

SELECT Id_companie, COUNT(Id_cursa) AS NR_CURSE FROM CURSE 
GROUP BY Id_companie 
ORDER BY Id_companie;

--Afiseaza numele tuturor tarilor si anul fondarii companiei aeriene din acea tara cu cel mai mare an de fondare.

SELECT Nume_tara, MAX(An_fondare) AS An_max
FROM COMPANII_AERIENE
GROUP BY Nume_tara 
ORDER BY An_max DESC;

--Interogarea: Afisati pretul cel mai mic pentru un bilet de tip business si compania aeriana care ofera acest bilet.

SELECT MIN(Pret) AS Pret_minim, Nume_companie 
FROM Bilete 
JOIN Curse 
ON Bilete.Id_zbor = Curse.Id_cursa 
JOIN Companii_aeriene 
ON Companii_aeriene.Id_companie = Curse.Id_companie 
WHERE Tip_bilet = 'business'
GROUP BY Nume_companie 
ORDER BY Pret_minim;

SELECT Tip_bilet, SUM(Pret) AS Pret_total
FROM Bilete
GROUP BY Tip_bilet;

-- Afiseaza numele pasagerilor si suma totala a preturilor biletelor cumparate de acestia.

SELECT PASAGERI.Nume_pasager, PASAGERI.Prenume_pasager, SUM(BILETE.Pret) AS Suma_totala_preturi
FROM PASAGERI
INNER JOIN BILETE ON BILETE.Id_pasager = PASAGERI.Id_pasager
GROUP BY PASAGERI.Nume_pasager, PASAGERI.Prenume_pasager;

--Realizati 6 interogari in care sa folositi structurile ierarhice;

 SELECT Id_membru, Nume_membru, Id_superior, LEVEL FROM ECHIPAJ
 CONNECT BY PRIOR Id_membru = Id_superior
 START WITH Id_membru in (1,5,9,13,17)
 ORDER BY LEVEL, Id_membru;

SELECT LEVEL, LPAD(' ',LEVEL)||Nume_membru AS NUME FROM ECHIPAJ
CONNECT BY PRIOR Id_membru = Id_superior
START WITH Id_membru in (1,5,9,13,17)
ORDER BY LEVEL, Id_membru;

SELECT Id_membru, Nume_membru, level-1 NUMAR_SUPERIORI, SYS_CONNECT_BY_PATH(Id_membru, ',') ID_SUPERIORI
FROM ECHIPAJ
START WITH Id_membru in (1,5,9,13,17)
CONNECT BY PRIOR Id_membru = Id_superior;

SELECT Id_zbor, AVG(Experienta) AS MEDIE_EXPERIENTA
FROM ECHIPAJ
START WITH Id_membru IN (1,5,9,13,17)
CONNECT BY PRIOR Id_zbor = Id_zbor
AND PRIOR Id_membru = Id_superior
GROUP BY Id_zbor;

SELECT Id_zbor, COUNT(*) NR_MEMBRI_ECHIPAJ FROM ECHIPAJ
 START WITH Id_superior IS NULL
 CONNECT BY PRIOR Id_membru = Id_superior
 GROUP BY Id_zbor;
 
SELECT Nume_membru, Id_superior, COUNT(DISTINCT Id_zbor) ZBORURI_DIFERITE
FROM ECHIPAJ
CONNECT BY PRIOR Id_membru = Id_superior
START WITH Id_membru in (1,5,9,13,17)
GROUP BY Nume_membru, Id_superior
ORDER BY ZBORURI_DIFERITE;

--Realizati 4 interogari in care sa folositi comanda CASE/ DECODE;

 SELECT Nume_pasager, Varsta_pasager, CASE 
	WHEN Tip_bilet = 'economic' THEN 'Bilet economic' 
	WHEN Tip_bilet = 'business' THEN 'Bilet business' 
	WHEN Tip_bilet = 'first' THEN 'Bilet first' 
	END AS Tip_bilet
FROM PASAGERI
JOIN BILETE ON BILETE.Id_pasager = PASAGERI.Id_pasager;

SELECT Nume_companie, Nume_tara, An_fondare, CASE 
	WHEN Nume_tara = 'Romania' THEN 'Companie aeriana romaneasca' 
	ELSE 'Companie aeriana straina' 
	END AS Natura_companie
FROM COMPANII_AERIENE;

SELECT DECODE(COMPANII_AERIENE.Nume_tara, 'Romania', 'RO', 'Germania', 'DE', 'Olanda', 'NL', 'Marea Britanie', 
'GB', 'Franta', 'FR', 'Irlanda', 'IE', 'Portugalia', 'PT', 'Italia', 'IT', 'Argentina', 'AR', 'Spania', 'ES') 
AS "NUME TARA", COMPANII_AERIENE.Nume_companie, COMPANII_AERIENE.An_fondare
FROM COMPANII_AERIENE;

SELECT DECODE(CURSE.Id_companie, 1, 'Tarom', 2, 'Wizz Air', 3, 'Blue Air', 4, 'Lufthansa', 5, 'KLM', 
6, 'British Airways', 7, 'Air France', 8, 'Ryanair', 9, 'TAP Portugal', 10, 'Alitalia') 
AS "NUME COMPANIE", CURSE.Aeroport_plecare, CURSE.Aeroport_sosire, CURSE.Durata_cursa
FROM CURSE;

--Realizati 3 interogari in care sa folositi operatorii MINUS, INTERSECT, UNION, cate una cu fiecare

SELECT Nume_companie 
FROM COMPANII_AERIENE
MINUS 
SELECT Nume_companie 
FROM COMPANII_AERIENE
WHERE Nume_tara = 'Romania';

SELECT Nume_aeroport 
FROM AEROPORTURI
WHERE Id_tara = 'RO'
INTERSECT
SELECT Aeroport_plecare
FROM CURSE;

SELECT Nume_pasager
FROM PASAGERI
WHERE Varsta_pasager < 30
UNION
SELECT Nume_pasager
FROM PASAGERI
WHERE Varsta_pasager >= 40;





