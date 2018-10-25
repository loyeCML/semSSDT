/****************************************
  Beispielskript zu Seminar
  "SQL Server Data Tools"

  Autor: Bernd Jungbluth
  Keine Gewährleistung, keine Haftung
****************************************/

CREATE VIEW vTelefonliste
AS

SELECT	
		Vorname, Nachname, Position, Durchwahl
FROM	
		dbo.Personal;