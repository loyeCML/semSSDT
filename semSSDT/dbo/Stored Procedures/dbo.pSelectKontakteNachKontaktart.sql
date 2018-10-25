CREATE PROCEDURE [dbo].pSelectKontakteNachKontaktart
	@Kontaktart char(1)
AS
	SELECT Firma, Strasse, PLZ, Ort, Telefon, Email, Kontaktart from dbo.Kontakte
	where Kontaktart = @Kontaktart
RETURN 0
