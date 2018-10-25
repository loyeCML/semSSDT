-- Sicht zur Ausgabe der Lieferantendaten
CREATE VIEW [dbo].[vLieferanten]
AS
	SELECT	[KontaktID], [Kontaktart], [Firma], [Namenszusatz], [Strasse], [Ort], [Region], [PLZ], [Staat], [Telefon], [Telefax], [Email], [iTS]
	FROM	dbo.Kontakte
	WHERE	Kontaktart = 'L';
