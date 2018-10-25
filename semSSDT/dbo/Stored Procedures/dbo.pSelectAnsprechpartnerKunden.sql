-- Gespeicherte Prozdure zur Ausgabe von Ansprechpartnerdaten abhängig von der Kontaktart Kunden
CREATE PROC [dbo].[pSelectAnsprechpartnerKunden] 
AS
SET NOCOUNT ON;

	SELECT	Nachname, Vorname, Anrede, Position, A.Telefon, Mobil, A.Email
	FROM	dbo.Ansprechpartner A INNER JOIN [dbo].vKunden K
			ON A.KontaktID = K.KontaktID;
